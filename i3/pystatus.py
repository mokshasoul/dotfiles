from i3pystatus import Status


status = Status()

# Display Keyboard Layout
# status.register("xkblayout")

# Displays Clock
status.register("clock",
                format="%a %-d %b %H:%M:%S")


status.register("temp",
                format="TEMP: {temp:.0f}°C",)


status.register("cpu_usage",
                format="CPU: {usage:02}%")

status.register("battery",
                format="BATTERY: {status}/{consumption:.2f}W {percentage:.2f}% {remaining:%E%hh:%Mm}",
                alert=True,
                alert_percentage=5,
                status={
                    "DIS": "↓",
                    "CHR": "↑",
                    "FULL": "=",
                },)

# status.register("runwatch",
#                 name="DHCP",
#                 path="/var/run/dhclient*.pid",)

status.register("network",
                interface="eth0",
                format_up="ETH: {v4cidr}",)

status.register("network",
                interface="wlo1",
                format_up="WLAN: {v4cidr}",)

status.register("disk",
                path="/",
                format="DISK: {used}/{total}G [{avail}G]",)

status.register("mem",
                format="MEM: {percent_used_mem}%",
                )

status.register("pulseaudio",
                format="♪{volume}")


status.register("pomodoro",
                sound="~/.config/i3/Buzz\ Fade\
                Out-SoundBible.com-286120031.wav")

status.run()
