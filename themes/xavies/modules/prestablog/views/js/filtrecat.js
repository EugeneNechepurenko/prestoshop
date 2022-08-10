/**
 * 2008 - 2020 (c) Prestablog
 *
 * MODULE PrestaBlog
 *
 * @author    Prestablog
 * @copyright Copyright (c) permanent, Prestablog
 * @license   Commercial

 */

( function($) {
	$(function() {
		var selectedCatFilter = new Object();
		$("div#categoriesFiltrage select[name=SelectCat]").change(function() {
			var keyCat = $(this).val();
			if(keyCat > 0) {
				if(!(keyCat in selectedCatFilter)) {
					selectedCatFilter[ keyCat ] = $("option:selected", this).text().trim();
					$("div#categoriesForFilter").append('<div class="filtrecat" rel="'+keyCat+'">'+$("option:selected", this).text().trim()+'<div class="deleteCat" rel="'+keyCat+'">X</div></div>');
					$("option:selected", this).attr('disabled','disabled');
					$('option:first-child', this).attr("selected", "selected");
				}
			}

			$("#prestablog_input_filtre_cat").html('');
			$("div#categoriesForFilter div.filtrecat").each(function() {
				$("#prestablog_input_filtre_cat").append('<input type="hidden" name="prestablog_search_array_cat[]" value="'+$(this).attr("rel")+'" />');
			});
		});

		$('div#categoriesFiltrage').delegate('div.deleteCat','click',function() {
			var keyCat = $(this).attr('rel');
			$("div#categoriesFiltrage select[name=SelectCat] option[value='"+keyCat+"']").removeAttr('disabled');
			$('div.filtrecat[rel="'+keyCat+'"]').remove();
			delete selectedCatFilter[keyCat];
			$('div#categoriesFiltrage select[name=SelectCat] option:first-child', this).attr("selected", "selected");

			$("#prestablog_input_filtre_cat").html('');
			$("div#categoriesForFilter div.filtrecat").each(function() {
				$("#prestablog_input_filtre_cat").append('<input type="hidden" name="prestablog_search_array_cat[]" value="'+$(this).attr("rel")+'" />');
			});
		});
	});
} ) ( jQuery );


var update_blog_grid = false;
var selected = [];
$(document).ready(function() {

	$(document).on('click','body#module-prestablog-blog #wrapper #left-column .btn-holder',function(){
		update_blog_grid = true;
		filter_blog();
	});

	$('#amazzing_filter ul.cat_filter input[type="checkbox"]').change(function() {
		$('#amazzing_filter ul.cat_filter input:checked').each(function() {
			selected.push($(this).val());
		});
		filter_blog();
	});

	$('#amazzing_filter ul.cat_filter input[type="checkbox"]').each(function() {
		$( '<div class="checkbox_input"></div>').insertAfter($(this));
	});
	
	/// subscribe popup
	var hide_popup = sessionStorage.getItem('hide_subscribe_popup');
	if (hide_popup == 1) {
		$('.subscribe_container').addClass('hide');
	}

 });

function filter_blog(){
	$.ajax({
		url: ajax_blog_filter_link,
		data: {
			category: selected
		},
		error: function() {
		},
		//dataType: 'jsonp',
		success: function(data) {
			if(typeof data.status !== "undefined" && data.status == true) {
				if(window.innerWidth <= 1275) {
					if (update_blog_grid) {
						$('body#module-prestablog-blog #wrapper #left-column .btn-holder').hide();
						update_blog_grid = false;
						$("ul#blog_list_1-7").html(data.news);
						$(".prestablog_pagination").html(data.pagination);
						$(".prestablog_pagination").addClass('ajax');
						$('#left-column').addClass('hide_filters')
						getAjaxPage();
					} else {
						$('body#module-prestablog-blog #wrapper #left-column .btn-holder').show();
						$('body#module-prestablog-blog #wrapper #left-column .btn-holder .af-total-count').text(data.news_count_all);
					}
				}
				else{
					$("ul#blog_list_1-7").html(data.news);
					$(".prestablog_pagination").html(data.pagination);
					$(".prestablog_pagination").addClass('ajax');
					$('#left-column').addClass('hide_filters')
					getAjaxPage();
				}

			}
		},
		type: 'GET'
	});
}

 function getAjaxPage(){
	$('.prestablog_pagination.ajax a').click(function() {
		var url_link = $(this).attr('data-url');
		if (url_link != "") {
			var selected = [];
			$('#amazzing_filter ul.cat_filter input:checked').each(function() {
				selected.push($(this).val());
			});
		
			$.ajax({
			  url: url_link,
			  data: {
				category_filter: selected
			  },
			  error: function() {
			  },
			  //dataType: 'jsonp',
			  success: function(data) {
				if(typeof data.status !== "undefined" && data.status == true) {
					$("ul#blog_list_1-7").html(data.news);
					$(".prestablog_pagination").html(data.pagination);
					getAjaxPage();
				}
			  },
			  type: 'GET'
			});
		}
	});	
}