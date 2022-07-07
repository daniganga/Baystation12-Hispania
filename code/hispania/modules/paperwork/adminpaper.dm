//Adminpaper - it's like paper, but more adminny!
/obj/item/paper/admin
	name = "administrative paper"
	desc = "If you see this, something has gone horribly wrong."
	var/datum/admins/admindatum = null

	var/interactions = null
	var/isCrayon = 0
	var/origin = null
	var/mob/sender = null
	/// List (`/obj/machinery/photocopier/faxmachine`). List of fax machines matching the paper's target department.
	var/list/destinations = list()
	/// String. The paper's target department.
	var/department = null

	var/header = null
	var/headerOn = TRUE

	var/footer = null
	var/footerOn = FALSE

	var/logo_list = list("sollogo.png","eclogo.png","fleetlogo.png","exologo.png","ntlogo.png","daislogo.png","xynlogo.png","terralogo.png", "sfplogo.png")
	var/logo = ""

	var/unformatedText = ""

/obj/item/paper/admin/New()
	..()
	generateInteractions()


/obj/item/paper/admin/proc/generateInteractions()
	//clear first
	interactions = null

	//Snapshot is crazy and likes putting each topic hyperlink on a seperate line from any other tags so it's nice and clean.
	interactions += "<HR><center><font size= \"1\">El fax transmitira todo lo que este por encima de esta linea.</font><br>"
	interactions += "<A href='?src=\ref[src];confirm=1'>Send fax</A> "
	interactions += "<A href='?src=\ref[src];penmode=1'>Pen mode: [isCrayon ? "Crayon" : "Pen"]</A> "
	interactions += "<A href='?src=\ref[src];cancel=1'>Cancel fax</A> "
	interactions += "<BR>"
	interactions += "<A href='?src=\ref[src];changelogo=1'>Cambiar logo</A> "
	interactions += "<A href='?src=\ref[src];changelanguage=1'>Cambiar idioma ([language])</A> "
	interactions += "<A href='?src=\ref[src];toggleheader=1'>Alternar Encabezado</A> "
	interactions += "<A href='?src=\ref[src];togglefooter=1'>Alternar pie</A> "
	interactions += "<A href='?src=\ref[src];clear=1'>Borrar</A> "
	interactions += "</center>"

/obj/item/paper/admin/proc/generateHeader()
	var/originhash = md5("[origin]")
	var/challengehash = copytext(md5("[game_id]"),1,10) // changed to a hash of the game ID so it's more consistant but changes every round.
	var/text = null
	//TODO change logo based on who you're contacting.
	text = "<center><img src = [logo]></br>"
	text += "<b>Comunicacion Interna del [origin]</b><br>"
	text += "<font size = \"1\">Clave de encriptacion: [originhash]<br>"
	text += "ID: [challengehash]<br></font></center><hr>"

	header = text

/obj/item/paper/admin/proc/generateFooter()
	var/text = null

	text = "<hr><font size= \"1\">"
	text += "Esta transmision esta destinada unicamente al destinatario y puede contener informacion confidencial. Cualquier divulgacion no autorizada esta estrictamente prohibida. <br><br>"
	text += "Si esta transmision se recibe por error, notifiquelo tanto al remitente como a la oficina de [GLOB.using_map.boss_name] Asuntos Internos inmediatamente para que se puedan tomar medidas correctivas."
	text += "El incumplimiento es una violacion de la regulacion y puede ser procesado con todo el peso de la ley."
	text += "</font>"

	footer = text


/obj/item/paper/admin/proc/adminbrowse()
	updateinfolinks()
	generateHeader()
	generateFooter()
	updateDisplay()

/obj/item/paper/admin/proc/updateDisplay()
	show_browser(usr, "<HTML><HEAD><TITLE>[name]</TITLE></HEAD><BODY>[headerOn ? header : ""][info_links][stamps][footerOn ? footer : ""][interactions]</BODY></HTML>", "window=[name];can_close=0")



/obj/item/paper/admin/Topic(href, href_list)
	if(href_list["write"])
		var/id = href_list["write"]

		var/t =  sanitize(input("Introduce lo que quieras escribir:", "Escribe", unformatedText, null) as message, MAX_PAPER_MESSAGE_LEN, extra = 0)

		if(!t)
			return

		var last_fields_value = fields

		unformatedText = t

		//t = html_encode(t)
		t = replacetext(t, "\n", "<BR>")
		t = parsepencode(t, null, null, isCrayon, null, TRUE) // Encode everything from pencode to html


		if(fields > 50)//large amount of fields creates a heavy load on the server, see updateinfolinks() and addtofield()
			to_chat(usr, "<span class='warning'>Demasiados campos. Lo siento, no puedes hacer esto.</span>")
			fields = last_fields_value
			return

		if(id!="end")
			addtofield(text2num(id), t) // He wants to edit a field, let him.
		else
			info = t // set the file to the new text
			updateinfolinks()

		//manualy set freespace
		free_space = MAX_PAPER_MESSAGE_LEN - length(strip_html_properly(t))

		updateDisplay()

		update_icon()
		return

	if(href_list["confirm"])
		switch(alert("Estas seguro de que quieres enviar el fax tal como esta?",, "Si", "No"))
			if("Si")
				if(headerOn)
					info = header + info
				if(footerOn)
					info += footer
				updateinfolinks()
				close_browser(usr, "window=[name]")
				admindatum.faxCallback(src)
		return

	if(href_list["penmode"])
		isCrayon = !isCrayon
		generateInteractions()
		updateDisplay()
		return

	if(href_list["cancel"])
		close_browser(usr, "window=[name]")
		qdel(src)
		return

	if(href_list["clear"])
		clearpaper()
		updateDisplay()
		return

	if(href_list["toggleheader"])
		headerOn = !headerOn
		updateDisplay()
		return

	if(href_list["togglefooter"])
		footerOn = !footerOn
		updateDisplay()
		return

	if(href_list["changelogo"])
		logo = input(usr, "Que logo?", "Elige un logo", "") as null|anything in (logo_list)
		generateHeader()
		updateDisplay()
		return

	if (href_list["changelanguage"])
		choose_language(usr, TRUE)
		updateDisplay()
		return
