--- 2bwm/2bwm.c	2018-11-09 10:50:30.152030667 +1100
+++ .2bwm/2bwm.c	2018-11-09 11:44:52.226612137 +1100
@@ -491,6 +491,10 @@
 		setfocus(findclient(&pointer->child));
 		free(pointer);
 	}
+	
+ 	char Output[60];
+	sprintf(Output, "%s%d", "bash /home/prashant/.scripts/deskswitch.sh ", ws);
+	system(Output);
 }
 
 void
@@ -868,11 +872,10 @@
 	xcb_change_property(conn, XCB_PROP_MODE_REPLACE, client->id,
 			ewmh->_NET_WM_STATE, ewmh->_NET_WM_STATE, 32, 2, data);
 
-	centerpointer(e->window,client);
 	updateclientlist();
-
+	setfocus(client);
 	if (!client->maxed)
-		setborders(client,true);
+		setborders(client,true); 
 }
 
 /* Set border colour, width and event mask for window. */
@@ -1556,7 +1559,90 @@
 	/* if NULL focuswin */
 	if (NULL != cl && focuswin != cl && cl->iconic==false) {
 		raisewindow(cl->id);
-		centerpointer(cl->id,cl);
+		setfocus(cl);
+	}
+}
+/* Change focus to next in window ring. */
+void
+focuslast_helper(bool arg)
+{
+	struct client *cl = NULL;
+	/* no windows on current workspace*/
+	if (NULL == wslist[curws])
+		return;
+	/* If we currently have no focus focus first in list. */
+	if (NULL == focuswin || NULL == focuswin->wsitem[curws]) {
+		cl  = wslist[curws]->data;
+		while (cl->iconic==true && cl->wsitem[curws]->prev!=NULL)
+			cl = cl->wsitem[curws]->prev->data;
+	} else {
+		if (arg == TWOBWM_FOCUS_NEXT) {
+			if (NULL == focuswin->wsitem[curws]->next) {
+				/* We were at the head of list.
+				 * Focusing on last window in list unless
+				 * we were already there.*/
+				cl = wslist[curws]->data;
+
+				/* Go to the end of the list */
+				while(cl->wsitem[curws]->prev != NULL)
+					cl = cl->wsitem[curws]->prev->data;
+				/* walk backward until we find
+				 * a window that isn't iconic */
+				while(cl->iconic == true)
+					cl = cl->wsitem[curws]->next->data;
+			} else
+				if (focuswin!=wslist[curws]->data) {
+					cl = focuswin->wsitem[curws]->next->data;
+					while (cl->iconic == true
+						&& cl->wsitem[curws]->next
+							!= NULL)
+						cl = cl->wsitem[curws]->next->data;
+					/* move to the head an didn't find a
+					 * window to focus so move to the end
+					 * starting from the focused win */
+					if(cl->iconic == true) {
+						cl = focuswin;
+						/* Go to the end of the list */
+						while(cl->wsitem[curws]->prev
+								!= NULL)
+							cl = cl->wsitem[curws]->prev->data;
+						while (cl->iconic == true)
+							cl = cl->wsitem[curws]->next->data;
+					}
+				}
+		} else {
+			/* We were at the tail of list.
+			 * Focusing on last window in list unless we
+			 * were already there.*/
+			if (NULL == focuswin->wsitem[curws]->prev) {
+				/* We were at the end of list.
+				 * Focusing on first window in list unless we
+				 * were already there. */
+				cl = wslist[curws]->data;
+				while(cl->iconic && cl->wsitem[curws]->prev
+						!= NULL)
+					cl = cl->wsitem[curws]->prev->data;
+			} else {
+				cl = focuswin->wsitem[curws]->prev->data;
+				while (cl->iconic == true
+						&& cl->wsitem[curws]->prev
+						!= NULL)
+					cl = cl->wsitem[curws]->prev->data;
+				/* we reached the end of the list without a
+				 * new win to focus, so reloop from the head */
+				if (cl->iconic == true) {
+					cl = wslist[curws]->data;
+					while(cl->iconic
+						&& cl->wsitem[curws]->prev
+						!= NULL)
+						cl = cl->wsitem[curws]->prev->data;
+				}
+			}
+		}
+	}
+	/* if NULL focuswin */
+	if (NULL != cl && focuswin != cl && cl->iconic==false) {
+		raisewindow(cl->id);
 		setfocus(cl);
 	}
 }
@@ -1626,7 +1712,6 @@
 
 	/* Remember the new window as the current focused window. */
 	focuswin = client;
-
 	grabbuttons(client);
 	setborders(client,true);
 }
@@ -1734,7 +1819,6 @@
 		focuswin->hormaxed  = false;
 
 	resizelim(focuswin);
-	centerpointer(focuswin->id,focuswin);
 	raise_current_window();
 	setborders(focuswin,true);
 }
@@ -1765,7 +1849,6 @@
 		focuswin->hormaxed  = false;
 
 	resizelim(focuswin);
-	centerpointer(focuswin->id,focuswin);
 	raise_current_window();
 	setborders(focuswin,true);
 }
@@ -2048,7 +2131,6 @@
 	moveresize(client->id, client->x, client->y,
 			client->width, client->height);
 
-	centerpointer(client->id,client);
 	setborders(client,true);
 }
 
@@ -2126,7 +2208,6 @@
 
 	noborder(&temp, focuswin,false);
 	raise_current_window();
-	centerpointer(focuswin->id,focuswin);
 	setborders(focuswin,true);
 }
 
@@ -2196,7 +2277,6 @@
 	noborder(&temp, focuswin, false);
 	raise_current_window();
 	fitonscreen(focuswin);
-	centerpointer(focuswin->id, focuswin);
 	setborders(focuswin, true);
 }
 
@@ -2380,6 +2460,7 @@
 		xcb_icccm_get_wm_protocols_reply_wipe(&protocols);
     }
     if (!use_delete) xcb_kill_client(conn, focuswin->id);
+    focuslast_helper(0);
 }
 
 void
@@ -2414,8 +2495,7 @@
 	raise_current_window();
 	fitonscreen(focuswin);
 	movelim(focuswin);
-	setborders(focuswin, true);
-	centerpointer(focuswin->id, focuswin);
+	setborders(focuswin, true); 
 }
 
 /* Function to make the cursor move with the keyboard */
@@ -2844,7 +2924,7 @@
 
 	xcb_destroy_notify_event_t *e = (xcb_destroy_notify_event_t *) ev;
 	if (NULL != focuswin && focuswin->id == e->window)
-		focuswin = NULL;
+		focuslast_helper(0);
 
 	cl = findclient( & e->window);
 
@@ -2887,9 +2967,6 @@
 		client = findclient(&e->event);
 		if (NULL == client)
 			return;
-
-		setfocus(client);
-		setborders(client,true);
 	}
 }
 
@@ -2918,13 +2995,13 @@
 	if (NULL == client || client->wsitem[curws]==NULL)
 		return;
 
-	if (focuswin!=NULL && client->id == focuswin->id)
-		focuswin = NULL;
-
 	if (client->iconic == false)
 		forgetclient(client);
 
 	updateclientlist();
+
+	if (focuswin!=NULL && client->id == focuswin->id)
+		focuslast_helper(0);
 }
 
 void
