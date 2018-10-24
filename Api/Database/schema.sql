CREATE TABLE restaurant (id INTEGER PRIMARY KEY AUTOINCREMENT, name text NOT NULL, address text NOT NULL, phone text NOT NULL, gps_location text);
CREATE TABLE menu_item (id INTEGER PRIMARY KEY, name TEXT NOT NULL, price TEXT NOT NULL, rid INTEGER NOT NULL, FOREIGN KEY(rid) REFERENCES restaurant(id));
CREATE TABLE profile (id INTEGER PRIMARY KEY, username TEXT NOT NULL, passhash TEXT NOT NULL);
CREATE TABLE order_parent (id INTEGER PRIMARY KEY, status INTEGER NOT NULL, detail TEXT, rid INTEGER NOT NULL, pid INTEGER NOT NULL, FOREIGN KEY(rid) REFERENCES restaurant(id), FOREIGN KEY(pid) REFERENCES profile(id));
CREATE TABLE order_element (id INTEGER PRIMARY KEY, oid INTEGER NOT NULL, mid INTEGER NOT NULL, FOREIGN KEY(oid) REFERENCES order_parent(id), FOREIGN KEY(mid) REFERENCES menu_item(id));
CREATE TABLE alerts (id INTEGER PRIMARY KEY, status INTEGER NOT NULL, detail TEXT, rid INTEGER NOT NULL,pid INTEGER NOT NULL,  FOREIGN KEY(rid) REFERENCES restaurant(id), FOREIGN KEY(pid) REFERENCES profile(id));