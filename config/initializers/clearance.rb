Clearance.configure do |config|
  config.mailer_sender = 'reply@example.com'
  config.rotate_csrf_on_sign_in = true
  config.cookie_expiration = ->(_cookies) { 1.year.from_now.utc }
end
