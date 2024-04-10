when CLIENT_ACCEPTED {
    # good traffic
    if { [IP::addr [IP::client_addr] equals 10.255.127.1] } {  
    set y [expr int(rand()*8)]
    switch -glob $y {
        1 {
            set ip_addr 148.165.[expr int(rand()*200)].[expr int(rand()*100)]
        }
        2 {
            set ip_addr 208.152.[expr int(rand()*200)].[expr int(rand()*100)]
        }        
        3 {
            set ip_addr 74.208.[expr int(rand()*200)].[expr int(rand()*100)]
        }       
        4 {
            set ip_addr 136.156.[expr int(rand()*200)].[expr int(rand()*100)]
        }
        5 {
            set ip_addr 109.174.128.[expr int(rand()*100)]
        }
        6 {
            set ip_addr 202.172.96.[expr int(rand()*100)]
        }
        7 {
            set ip_addr 177.47.160.[expr int(rand()*100)]
        }
        default {
            set ip_addr 137.132.[expr int(rand()*200)].[expr int(rand()*100)]
        }
    }
}

    # bad traffic
    if { [IP::addr [IP::client_addr] equals 10.255.34.199] } {      
    set y [expr int(rand()*5)]
    switch -glob $y {
        1 {
            set ip_addr 188.160.59.10[expr int(rand()*3)]
        }
        2 {
            set ip_addr 94.141.192.20[expr int(rand()*3)]
        }    
        3 {
            set ip_addr 175.45.179.9[expr int(rand()*3)]
        }
        4 {
            set ip_addr 175.45.176.5[expr int(rand()*2)]
        }    
        default {
            set ip_addr 41.189.192.22[expr int(rand()*3)]
        }
    }
	}
}

when HTTP_REQUEST {
    HTTP::header insert X-Forwarded-For $ip_addr
}
