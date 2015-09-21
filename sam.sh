cat > /tmp/sam.sh <<-EOH
echo $1
echo $2
EOH
chmod 755 /tmp/sam.sh
. /tmp/sam.sh
