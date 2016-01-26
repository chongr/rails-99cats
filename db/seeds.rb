Cat.create!({name: 'Snuggles', birth_date: Date.parse('11-04-1991'), color: 'platinum', sex: 'F'})
Cat.create!({name: 'Mr. Cat', birth_date: Date.parse('08-12-2015'), color: 'black', sex: 'F'})
Cat.create!({name: 'Grinch', birth_date: Date.parse('10-10-1804'), color: 'green', sex: 'M'})


CatRentalRequest.create!({cat_id: 1, start_date: Date.parse('11-11-2015'), end_date: Date.parse('12-12-2015')})
CatRentalRequest.create!({cat_id: 1, start_date: Date.parse('10-10-2015'), end_date: Date.parse('30-11-2015')})
CatRentalRequest.create!({cat_id: 1, start_date: Date.parse('20-11-2015'), end_date: Date.parse('01-01-2016')})
CatRentalRequest.create!({cat_id: 1, start_date: Date.parse('10-10-2014'), end_date: Date.parse('30-11-2014')})
