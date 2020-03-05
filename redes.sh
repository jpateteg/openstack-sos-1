# Las redes las definimos de la siguiente forma:

### Creamos las redes que usaremos en el ambiente. Debemos definirlas antes de crear las maquinas virtuales

cat > /tmp/oam.xml <<EOF
<network>
  <name>oam</name>
  <forward mode='nat'>
    <nat>
      <port start='1024' end='65535'/>
    </nat>
  </forward>
  <ip address="172.16.0.254" netmask="255.255.255.0"/>
</network>
EOF

cat > /tmp/internal.xml <<EOF
<network>
  <name>internal</name>
  <forward mode='nat'>
    <nat>
      <port start='1024' end='65535'/>
    </nat>
  </forward>
  <ip address="192.168.0.1" netmask="255.255.255.0"/>
</network>
EOF

#Y posteriormente las definimos de forma manual o automatica

for NETWORK in oam internal 
do
  virsh net-define /tmp/${NETWORK}.xml
  virsh net-autostart ${NETWORK}
  virsh net-start ${NETWORK}
done
