import requests
from bs4 import BeautifulSoup

url = 'http://bandi.miur.it/jobs.php/public/cercaJobs?jv_comp_status_id=2-3&bb_type_code=%25&idsettore=13%2FD1&idqualifica=21&azione=cerca'
url = 'http://bandi.miur.it/jobs.php/public/cercaJobs?jv_comp_status_id=5&bb_type_code=%25&idsettore=03%2FA1&idqualifica=%25&azione=cerca'
url ='http://bandi.miur.it/jobs.php/public/cercaJobs?jv_comp_status_id=2-3&bb_type_code=%25&idsettore=09%2FF2&idqualifica=22&azione=cerca'
parsed_html = BeautifulSoup(requests.get(url).text)
results = (parsed_html.body.find('div', attrs={'class':'result'}))
print(results.text)
type(results)
results.text.strip('\n').split('\n')
type(results)
