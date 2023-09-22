{pkgs, ...}:
{
    services = {
        polybar = {
            enable = true;
            package = pkgs.polybar.override {};
            config = {
                "bar/example" = {
                    width = "100%";
                    height = "22pt";
                    radius = 0;
                    modules-left = "xmonad";
                    modules-right = "date";
                    cursor-click = "pointer";
                    cursor-scroll = "ns-resize";
                    enable-ipc = true;
                    override-redirect = true;
                };
                "module/xmonad" = {
                    type = "custom/script";
                    exec = "xmonad-log";
                    tail = true;
                };
            };
            script = "polybar bar &";
        };
    };
}
