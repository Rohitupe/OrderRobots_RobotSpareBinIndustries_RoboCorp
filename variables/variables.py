# +
# Delay Variables in Sec.
d_small = 2
d_medium = 5
d_large = 10

# Website URL/File name
# web_URL = r"https://robotsparebinindustries.com/"
file_name = "orders.csv"
robot_orders = r"#/robot-order"

# +
# xPath For Popup Message
popup_window = r'xpath://div[@class="modal-header"]'
popup_ok_button = r'xpath://div[@class="alert-buttons"]/button[1]'

# Order Your Robot Form Page
order_robot_identifer = r'//div[@class="container"]/h2'
head = 'id:head'
legs = r'//input[@type="number" and @class="form-control"]'
address = 'id:address'
order_first = 'id:order'
order_another = 'id:order-another'
preview_button = 'id:preview'
preview_image = 'id:robot-preview-image'
# +
# Xpaths for Generate Output Report

# $$ Xpath for Tex Output
receipt_xpath = 'xpath://div[@id="receipt"]'
receipt_title = receipt_xpath + '/h3'
receipt_datetime = receipt_xpath + '/div[1]'
receipt_id = receipt_xpath + '/p[1]'
receipt_address = receipt_xpath + '/p[2]'
receipt_order = receipt_xpath + '/div[@id="parts"]'
receipt_note = receipt_xpath + '/p[3]'


# $$ Xpath for Image
robot = 'xpath://div[@id="robot-preview-image"]'

# +
# get Website URL from the Vault.json
from RPA.Robocorp.Vault import Vault

# read secrets from vault.json file
_secret = Vault().get_secret("WebURL")
WebsiteURL = _secret["WebsiteURL"]
