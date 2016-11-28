AdminUser.where(email: 'admin@site.co.uk').first_or_create(password: 'site2015', password_confirmation: 'site2015')
GlobalConfig.where(contact_email: 'info@site.co.uk').first_or_create(description: 'site', name: 'site', url: 'http://site.co.uk')
SocialAccount.where(platform: 'Facebook').first_or_create(icon_tag: 'facebook', url: 'http://facebook.com/site')
SocialAccount.where(platform: 'Twitter').first_or_create(icon_tag: 'twitter', url: 'http://twitter.com/site')
SocialAccount.where(platform: 'Instagram').first_or_create(icon_tag: 'instagram', url: 'http://instagram.com/site')
Toy.where(name: 'Jetski').first_or_create