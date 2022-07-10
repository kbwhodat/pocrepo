input { stdin { } }

output {
  elasticsearch { 
    hosts => ["http://1921680.us-1.sharedwithexpose.com:80"] 
    index => "poc_test"
  }
  stdout { codec => rubydebug }
}