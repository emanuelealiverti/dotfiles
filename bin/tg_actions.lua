function on_msg_receive (msg)
      if msg.out then
          return
      end
      if (msg.text=='ping') then
            send_msg (msg.from.print_name, 'pong', ok_cb, false)
	    os.execute("notify-send 'test'")
      end
end
