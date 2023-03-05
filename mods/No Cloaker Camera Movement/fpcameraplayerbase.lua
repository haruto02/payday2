function FPCameraPlayerBase:clbk_aim_assist(col_ray)
	if managers.controller:get_default_wrapper_type() ~= "pc" and managers.user:get_setting("aim_assist") then
		self:_start_aim_assist(col_ray, self._aim_assist)
	end
end