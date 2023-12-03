#set env vars
set -o allexport; source .env; set +o allexport;

#wait until the server is ready
echo "Waiting for software to be ready ..."
sleep 60s;


csrfToken=$(curl -s https://${DOMAIN}/index.php/installation/index | grep -oP 'csrfToken: "\K[^"]+')

curl https://${DOMAIN}/index.php/installation/ajax_install \
  -H 'accept: application/json, text/javascript, */*; q=0.01' \
  -H 'accept-language: fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7,he;q=0.6,zh-CN;q=0.5,zh;q=0.4' \
  -H 'cache-control: no-cache' \
  -H 'content-type: application/x-www-form-urlencoded; charset=UTF-8' \
  -H 'cookie: csrfCookie='${csrfToken}';' \
  -H 'pragma: no-cache' \
  -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36' \
  -H 'x-requested-with: XMLHttpRequest' \
  --data-raw 'csrfToken='${csrfToken}'&admin%5Bfirst_name%5D=admin&admin%5Blast_name%5D=admin&admin%5Bemail%5D='${ADMIN_EMAIL}'&admin%5Bphone_number%5D=000&admin%5Busername%5D=admin&admin%5Bpassword%5D='${ADMIN_PASSWORD}'&company%5Bcompany_name%5D=Company&company%5Bcompany_email%5D='${SMTP_FROM_EMAIL}'&company%5Bcompany_link%5D=Company' \
  --compressed