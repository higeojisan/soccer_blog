$(document).ready(function() {
	$(".favorite-link").on("click", function() {
		article_id = $(this).data("id");
		logged_in = $("#logged-in").data("logged");
		csrf_token = $('meta[name="csrf-token"]').attr('content');
		favorite = $(this);
		
		if (logged_in == false) {
			// 未ログイン時の動作
			$("#login-modal").click();
			return false;
		}
		
		if ($(this).hasClass("favorite")) {
			method = "delete";
		} else {
			method = "post";
		}
		
		$.ajax("/favorites", 
			{
				type: method, 
				data: { article_id: article_id },
				headers: { "X-CSRF-Token": csrf_token },
				beforeSend: function(xhr, settings) {
        	favorite.attr('disabled', true);
        },
			}	
		)
		.done(function(data) {
			favorite.toggleClass("favorite");
			if (favorite.children("i").hasClass("fa-heart-o")) {
				favorite.children("i").removeClass("fa-heart-o");
				favorite.children("i").addClass("fa-heart");
			} else {
				favorite.children("i").removeClass("fa-heart");
				favorite.children("i").addClass("fa-heart-o");
			}
			favorite.attr('disabled', false);
		});
	});
});
