class Cuenta < ActiveRecord::Base
	validates_format_of :usuario, :message => "debe ser numérico y de 2 a 5 digitos.", :with => /^[0-5]{2,5}$/
  validates_uniqueness_of :usuario, :message => "ya existe por favor, verifique."
  validates_presence_of :nombre, :message => "debe ser especificado."
  
  def monitor_str
    return (monitor) ? 'Si' : 'No'
  end
  
  def status_str
    strOut = ""
    if monitor
      if Location.find(:first, :conditions => ["username = ?", usuario])
        strOut += '<img src=\'/images/status_green.png\' width=\'14\' height=\'14\' alt=\'Online\' />'
        strOut += '&nbsp;'
        strOut += "Online"
      else
        strOut += '<img src=\'/images/status_red.png\' width=\'14\' height=\'14\' alt=\'Offline\' />'
        strOut += '&nbsp;'
        strOut += "Offline"
      end
    else
      strOut += '<img src=\'/images/status_gray.png\' width=\'14\' height=\'14\' alt=\'Not monitoring\' />'
      strOut += '&nbsp;'
      strOut += "Not monitoring"      
    end
    return strOut
  end
end
