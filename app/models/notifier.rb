class Notifier < ActionMailer::Base
	
  def monitor(cuentas)
    recipients OPENSERMON_CONFIG['notifications']['emails']
    from OPENSERMON_CONFIG['notifications']['from']
    subject OPENSERMON_CONFIG['notifications']['subject']
    content_type "text/html"
    body :cuentas => Cuenta.find(:all, :conditions => ['usuario in (?)', cuentas])
  end
	
  def monitor_online(cuentas)
    recipients OPENSERMON_CONFIG['notifications']['emails']
    from OPENSERMON_CONFIG['notifications']['from']
    subject OPENSERMON_CONFIG['notifications']['subject']+' - Back Online'
    content_type "text/html"
    body :cuentas => Cuenta.find(:all, :conditions => ['usuario in (?)', cuentas])
  end
	
  def notificar_usuario(cuenta)
		who = Cuenta.find(:first, :conditions => ['usuario = ?', cuenta])
		recipients who.email
		from OPENSERMON_CONFIG['notifications']['from']
		subject OPENSERMON_CONFIG['notifications']['subject']
		content_type "text/html"
		body :cuenta => who
  end
	
  def notificar_online_usuario(cuenta)
		who = Cuenta.find(:first, :conditions => ['usuario = ?', cuenta])
		recipients who.email
		from OPENSERMON_CONFIG['notifications']['from']
		subject OPENSERMON_CONFIG['notifications']['subject']+' - Back Online'
		content_type "text/html"
		body :cuenta => who
  end
	
end
