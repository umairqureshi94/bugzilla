$(document).on 'click', '#bug_b_type', ->
	bug_type = $('#bug_b_type').val()
	if bug_type == "BUG"
		console.log(bug_type)
		$('#bug_status').show()
		$('#feature_status').hide()
	else
		console.log(bug_type)
		$('#bug_status').hide()
		$('#feature_status').show()


