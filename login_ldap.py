#ble to import ldap run pip install python-ldap 

import ldap
 
if __name__ == "__main__":
  	ldap_server="ldap.usb.ve"
	username = "11-10683"
	password= "NJmarquez2012"
	# the following is the user_dn format provided by the ldap server
	user_dn = "uid="+username+",ou=People,dc=ldc,dc=usb,dc=ve"
	# adjust this to your base dn for searching
	base_dn = "dc=usb,dc=ve"
	connect = ldap.open(ldap_server)
	search_filter = "uid="+username
	try:
		#if authentication successful, get the full user data
		connect.bind_s(user_dn,password)
		result = connect.search_s(base_dn,ldap.SCOPE_SUBTREE,search_filter)
		print(result)
		# return all user data results
		connect.unbind_s()
		print result
	except ldap.LDAPError:
		connect.unbind_s()
		print('fallo')

