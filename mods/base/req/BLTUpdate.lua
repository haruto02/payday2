---@class BLTUpdate
---@field new fun(self, parent_mod: BLTMod, data: table):BLTUpdate
BLTUpdate = blt_class()
BLTUpdate.enabled = true
BLTUpdate.parent_mod = nil
BLTUpdate.id = ""
BLTUpdate.name = "BLT Update"
BLTUpdate.revision = 1
BLTUpdate.dir = "mods/"
BLTUpdate.folder = ""

function BLTUpdate:init(parent_mod, data)
	assert(parent_mod, "BLTUpdates can not be created without a parent mod!")
	assert(data, "BLTUpdates can not be created without json update data!")

	self.parent_mod = parent_mod
	self.id = data["identifier"] or ""
	self.name = data["display_name"] or parent_mod:GetName()
	self.dir = data["install_dir"] or "mods/"
	self.folder = data["install_folder"] or parent_mod:GetId()
	self.disallow_update = data["disallow_update"] or false
	self.hash_file = data["hash_file"] or false
	self.critical = data["critical"] or false
	self.host = data["host"]
	self.present_func = data["present_func"]
end

function BLTUpdate:__tostring()
	return string.format("[BLTUpdate %s (%s)]", self:GetName(), self:GetId())
end

function BLTUpdate:IsEnabled()
	return self.enabled
end

function BLTUpdate:SetEnabled(enable)
	self.enabled = enable
end

function BLTUpdate:RequiresUpdate()
	return self._requires_update
end

function BLTUpdate:CheckForUpdates(clbk)
	-- Flag this update as already requesting updates
	self._requesting_updates = true

	-- Perform the request from the server
	local url = self.host.meta

	-- Make the actual request
	dohttpreq(url, function(json_data, http_id)
		self:clbk_got_update_data(clbk, json_data, http_id)
	end)
end

function BLTUpdate:clbk_got_update_data(clbk, json_data, http_id)
	if json_data:is_nil_or_empty() then
		BLT:Log(LogLevel.WARN, "Could not connect to the download server!")
		self._error = "Could not connect to the download server."
		return self:_run_update_callback(clbk, false, self._error)
	end

	-- We're done checking for updates
	self._requesting_updates = false

	local server_data = json.decode(json_data)
	if server_data then
		for _, data in pairs(server_data) do
			BLT:Log(LogLevel.INFO, string.format("[Updates] Received update data for '%s'", data.ident))
			if data.ident == self:GetId() then
				self._update_data = data
				if data.hash then -- Use hash to check
					self._server_hash = data.hash
					self._uses_hash = true
				elseif data.version then -- Use version
					self._server_version = data.version
					self._uses_hash = false
					return self:_run_update_callback(clbk, self.parent_mod.version ~= data.version) -- Request an update if the versions don't equal.
				end

				local dat = {data, clbk}
				local hash_result = self:GetHash(callback(self, self, "_check_hash", dat))

				-- Nil indicates the file to hash was missing
				-- True indicates our callback will be run at a later date
				-- A string is the hashed value
				if not hash_result then
					-- Errored, file does not exist
					self._error = "File to be version checked was missing on local machine"
					BLT:Log(LogLevel.ERROR, "[Updates] " .. self._error .. " mod " .. self:GetId())
					return self:_run_update_callback(clbk, false, self._error)
				elseif hash_result ~= true then
					-- Manually check the hash, since we're running on an old
					-- version of the DLL that doesn't support the callbacks
					return self:_check_hash(dat, hash_result)
				else
					-- At this point we've started the hash callback
					-- Keep 'Checking for Updates' until the hash is complete
					-- as this is set to false above in the check_hash callback
					self._requesting_updates = true
					return
				end
			end
		end
	end

	self._error = "No valid mod ID was returned by the server."
	BLT:Log(LogLevel.ERROR, "[Updates] Invalid or corrupt update data for mod " .. self:GetId())
	return self:_run_update_callback(clbk, false, self._error)
end

function BLTUpdate:_check_hash(dat, local_hash)
	local data, clbk = unpack(dat)

	self._requesting_updates = false

	BLT:Log(LogLevel.INFO, string.format("[Updates] Comparing hash data for %s:\nServer: %s\n Local: %s", data.ident, data.hash, local_hash))
	if not data.hash then
		BLT:Log(LogLevel.WARN, string.format("[Updates] [WARN] Missing server hash for mod %s", data.ident))
		return self:_run_update_callback(clbk, false)
	end

	if data.hash == local_hash then
		return self:_run_update_callback(clbk, false)
	end

	return self:_run_update_callback(clbk, true)
end

function BLTUpdate:_run_update_callback(clbk, requires_update, error_reason)
	self._requires_update = requires_update
	clbk(self, requires_update, error_reason)
	return requires_update
end

function BLTUpdate:IsCheckingForUpdates()
	return self._requesting_updates or false
end

function BLTUpdate:GetParentMod()
	return self.parent_mod
end

function BLTUpdate:GetId()
	return self.id
end

function BLTUpdate:GetName()
	return self.name
end

function BLTUpdate:GetHash(callback)
	if self.hash_file then
		return file.FileExists(self.hash_file) and file.FileHash(self.hash_file, callback) or nil
	else
		local directory = Application:nice_path(self:GetInstallDirectory() .. "/" .. self:GetInstallFolder(), true)
		return file.DirectoryExists(directory) and file.DirectoryHash(directory, callback) or nil
	end
end

function BLTUpdate:GetServerHash()
	return self._server_hash
end

function BLTUpdate:GetServerVersion()
	return self._server_version
end

function BLTUpdate:UsesHash()
	return self._uses_hash
end

function BLTUpdate:GetInstallDirectory()
	return self.dir
end

function BLTUpdate:GetInstallFolder()
	return self.folder
end

function BLTUpdate:DisallowsUpdate()
	return self.disallow_update ~= false
end

function BLTUpdate:GetDisallowCallback()
	return self.disallow_update
end

function BLTUpdate:GetPatchNotes()
	return (self._update_data and self._update_data.patchnotes_url) or self.host.patchnotes
end

function BLTUpdate:IsCritical()
	return self.critical
end

function BLTUpdate:ViewPatchNotes()
	-- Use the URL returned in the update metadata if possible
	-- this allows for easier migration of URLs
	local url = self:GetPatchNotes()

	if Steam:overlay_enabled() then
		Steam:overlay_activate("url", url)
	else
		os.execute("cmd /c start " .. url)
	end
end

function BLTUpdate:GetDownloadURL()
	-- Use the URL returned in the update metadata if possible
	-- this allows for easier migration of URLs
	if self._update_data and self._update_data.download_url then
		return self._update_data.download_url
	end

	return self.host.download
end

function BLTUpdate:GetUpdateMiscData()
	if not self._update_data then
		return nil
	end

	return self._update_data.misc_data
end

function BLTUpdate:IsInstall()
	return false
end

function BLTUpdate:IsPresent()
	if self.present_func then
		return BLTUpdateCallbacks[self.present_func](self)
	end

	return true
end

function BLTUpdate:GetError()
	return self._error
end
