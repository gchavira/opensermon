#
# Describe of Table Location in OpenSER Database
#
# +---------------+------------------+------+-----+---------------------+----------------+
# | Field         | Type             | Null | Key | Default             | Extra          |
# +---------------+------------------+------+-----+---------------------+----------------+
# | id            | int(10) unsigned |      | PRI | NULL                | auto_increment |
# | username      | varchar(64)      |      | MUL |                     |                |
# | domain        | varchar(64)      | YES  |     | NULL                |                |
# | contact       | varchar(255)     |      |     |                     |                |
# | received      | varchar(128)     | YES  |     | NULL                |                |
# | path          | varchar(128)     | YES  |     | NULL                |                |
# | expires       | datetime         |      |     | 2020-05-28 21:32:15 |                |
# | q             | float(10,2)      |      |     | 1.00                |                |
# | callid        | varchar(255)     |      |     | Default-Call-ID     |                |
# | cseq          | int(11)          |      |     | 13                  |                |
# | last_modified | datetime         |      |     | 1900-01-01 00:00:01 |                |
# | flags         | int(11)          |      |     | 0                   |                |
# | cflags        | int(11)          |      |     | 0                   |                |
# | user_agent    | varchar(255)     |      |     |                     |                |
# | socket        | varchar(64)      | YES  |     | NULL                |                |
# | methods       | int(11)          | YES  |     | NULL                |                |
# +---------------+------------------+------+-----+---------------------+----------------+
#
#

class Location < ActiveRecord::Base
  establish_connection :openser
  set_table_name "location"
  set_primary_keys :username, :domain, :contact
  
  def validez
    intLen = expires - last_modified
    hours = (intLen /3600).to_i
    minutes = ((intLen - hours * 3600) / 60).to_i
    seconds = intLen - (hours * 3600) - (minutes * 60)
    return sprintf("%02i:%02i:%02i", hours, minutes, seconds)
  end
end
