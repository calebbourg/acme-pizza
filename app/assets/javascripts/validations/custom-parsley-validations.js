$(document).on('turbolinks:load', function () {
  console.log('turbolinks');
// validates that a date is in the future
	window.Parsley.addValidator('dateFuture', {
		validateString: function (value, requirement) {
			console.log(value)
			return new Date(value) > new Date();
		},
		messages: { en: 'This date must be in the future.' }
	});

    window.Parsley.addValidator('phoneFormat', {
		validateString: function (value, requirement) {
		  return /^[0-9]{10}$/.test(value);
		},
		messages: { en: 'Phone number is not correct format (ex. 5555555555).'}
	});

	$('#new_order').parsley();
});