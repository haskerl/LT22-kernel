--- drivers/net/wireless/bcmdhd/wl_cfg80211.c
+++ drivers/net/wireless/bcmdhd/wl_cfg80211.c
@@ -2866,7 +2866,8 @@
 			if (memcmp(mac, curmacp, ETHER_ADDR_LEN)) {
 				WL_ERR(("Wrong Mac address: "MACSTR" != "MACSTR"\n",
 					MAC2STR(mac), MAC2STR(curmacp)));
-				return -ENOENT;
+				err = -ENOENT;
+				goto get_station_err;
 			}
 			/* Report the current tx rate */
 			err = wldev_ioctl(dev, WLC_GET_RATE, &rate, sizeof(rate), false);
@@ -2886,13 +2887,16 @@
 					sizeof(scb_val_t), false);
 				if (err) {
 					WL_ERR(("Could not get rssi (%d)\n", err));
-					return err;
+					goto get_station_err;
 				}
 				rssi = dtoh32(scb_val.val);
 				sinfo->filled |= STATION_INFO_SIGNAL;
 				sinfo->signal = rssi;
 				WL_DBG(("RSSI %d dBm\n", rssi));
 			}
+get_station_err:
+		if (err)
+			cfg80211_disconnected(dev, 0, NULL, 0, GFP_KERNEL);
 	}
 
 	return err;
