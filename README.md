# AS-Hijacking

You can identify if an AS Number has been hijacked and if a different range with your AS Number is being advertised in the network.

## How to use script ASHijacking.sh

```bash
yum -y install jq
or
apt -y install jq

mkdir ASHijacking
cd ASHijacking/

curl -s "https://stat.ripe.net/data/announced-prefixes/data.json?resource=YourASN" | jq -r '.data.prefixes[].prefix' > ranges.txt

wget -O ASHijacking.sh https://raw.githubusercontent.com/MrAriaNet/AS-Hijacking/main/ASHijacking.sh
chmod +x ASHijacking.sh
bash ASHijacking.sh
```

## Author

[Aria](https://github.com/MrAriaNet)
