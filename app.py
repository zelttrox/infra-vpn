import os
import tkinter as tk

global state
state = "Down"

def start_vpn():
    global state
    os.system("src/vpn_up.sh")
    state = "Up"
    state_label.config(text="State: " + state)  # Update label

def stop_vpn():
    global state
    os.system("src/vpn_down.sh")
    state = "Down"
    state_label.config(text="State: " + state)  # Update label

def exit():
    if (state == "Up"): stop_vpn()
    root.destroy()

# Create GUI window
root = tk.Tk()
root.title("VPN")
root.geometry("300x250")

# Add buttons for "On" and "Off"
on_button = tk.Button(root, text="Turn VPN On", command=start_vpn, bg="green", fg="white", font=("Arial", 14))
off_button = tk.Button(root, text="Turn VPN Off", command=stop_vpn, bg="red", fg="white", font=("Arial", 14))
exit_button = tk.Button(root, text="Exit", command=exit, bg="red", fg="white", font=("Arial", 16))

state_label = tk.Label(root, text=("State: " + state), font=("Arial", 12))
state_label.pack(pady=10)

# Place the buttons in the window
on_button.pack(pady=10)
off_button.pack(pady=10)
exit_button.pack(pady=10)

# Start the GUI event loop
root.mainloop()
