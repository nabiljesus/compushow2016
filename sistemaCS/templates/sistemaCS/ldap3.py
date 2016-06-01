from ldap3 import Server, Connection, AUTH_SIMPLE, STRATEGY_SYNC, ALL
s = Server(HOST, port=389, get_info=ALL)
c = Connection(s, authentication=AUTH_SIMPLE, user=user_dn, password=PASSWORD, check_names=True, lazy=False, client_strategy=STRATEGY_SYNC, raise_exceptions=False)
c.open()
c.bind()