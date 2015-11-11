http://pc.rsbwl.com/CBS/jfpc/demo_nomob.jsp	
  JSON	
  Body：{“sid”:”e25147dcae35bd22ffc32d2b929203c6”,"resultCode":"0","resultMsg":"Success"}	
 

http://xxx.xxx.xxx/report.jsp?ID=XXXXX&Mobile=XXXX&ServiceID=XXXX&FeeCode=xxxxx&FeeTime=XXXXXXX&Prv=xxxxx&Report=XXXXX&Status=xxxxx	





entry_url_1 = "http://request.jfirst.com.cn/woreadchannel/BillingReq"

imsi = @context[:user].try(:current_imsi) || ''
imei = @context[:user].try(:current_imei) || "477899141#{imsi[4, 6]}"

entry_post_data_1 = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>
<?xml version="1.0" encoding=" UTF-8"?>
<ROOT>
<IMSI>#{imsi}</IMSI>
<IMEI>#{imei}</IMEI>
<SMSCN></SMSCN>
<MOBILE>#{phone_num}</MOBILE>
<CID>71123</CID>
<FEEVALUE>200</FEEVALUE>
<VERIFYCODE>shhd1123</VERIFYCODE>
<IP>219.135.26.14</IP>
<EXTPARAM></EXTPARAM>
<APPNAME>天天酷跑</APPNAME>
<SUBJECT>10元金币</SUBJECT>
<UID>4600211780035741266030001</UID>
</ROOT>

visit(entry_url_1, :apn => 'all', :data => entry_post_data_1)
spcode = collect(:string, :prefix => "<SPCODE>", :postfix => "</SPCODE>")
code = collect(:string, :prefix => "<VERIFYCODE>", :postfix => "</VERIFYCODE>")
result = collect(:send_to_sms,:code => code,:dest_number => spcode)





PC-页游-搜神志-10元


音乐空间IVR