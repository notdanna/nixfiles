{ pkgs, ... }: {

  services.yabai = {
  enable = true;
  extraConfig = ''
    sudo yabai --load-sa
    yabai -m signal --add event=dock_did_restart action="sudo yabai --load-sa"

    yabai -m config external_bar all:40:0 \
      mouse_follows_focus off \
      focus_follows_mouse off \
      window_zoom_persist off \
      window_placement second_child \
      window_shadow float \
      window_opacity on \
      window_opacity_duration 0.2 \
      active_window_opacity 1.0 \
      normal_window_opacity 1.0 \
      window_animation_duration 0.1 \
      window_animation_easing ease_out_quint \
      insert_feedback_color 0xff9dd274 \
      split_ratio 0.50 \
      auto_balance off \
      mouse_modifier alt \
      mouse_action1 move \
      mouse_action2 resize \
      mouse_drop_action swap \
      top_padding 0 \
      bottom_padding 6 \
      left_padding 8 \
      right_padding 8 \
      window_gap 8

    yabai -m config layout float
  '';
};

}