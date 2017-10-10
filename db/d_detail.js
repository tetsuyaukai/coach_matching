/**
 * 国内
 * 再検索画面
 */

//再検索で閉じるボタンを押した際に、初回表示をもってくるので
//そのための再検索画面のバックアップ
var backupDetailSearch = [];

// バックアップするsearch項目
var backupDetailArray = [];

//再検索で閉じるボタンを押した際に、初回表示をもってくるので
//そのためのinputのバックアップ
var backupInput = "";

// 再検索結果ページ（初期設定）
$(document).on('pageinit','#search_detail_page',function(e) {

	ditailInit();

	//スライダ
//	$(this).on("change", "#price_min,#price_max", function(){
	$(document).on("change","#price_min,#price_max", function() {

		var price_min = $("#price_min").val();
		var price_max = $("#price_max").val();

		// 100万の時
		if(price_t[price_max] == '1000000')
		{
			$(".price-txt span").html(addFigure(price_t[price_min]) + '〜上限なし');
			// 値を反映
			$("#p_price_min").val(price_t[price_min]);
			$("#p_price_max").val("");
		}
		else
		{
			$(".price-txt span").html(addFigure(price_t[price_min]) + '〜' + addFigure(price_t[price_max]) + '円');
			//値を反映
			$("#p_price_min").val(price_t[price_min]);
			$("#p_price_max").val(price_t[price_max]);
		}

		checkFooterSearch();


	});

	//▼キーワードを変更したとき
	$(this).on("blur", "#free_word", function(){
		//件数取得

		$("#p_free_word").val($(this).val());
		checkFooterSearch();

	});


	if($("#free_flag").val() != '')
	{
		// バックアップする項目を定義
		backupDetailArray =
			[
		 		'search_transport',
		 		'search_hatsu',
		 		'search_dep_airport',
		 		'search_arr_airport',
		 		'search_destination',
		 		'search_date',
		 		'search_kikan',
		 		'search_stay_number',
		 		'search_airline',
		 		'search_hotel',
		 		'search_stock',
		 		'search_decide',
		 		'search_mainbrand',
		 		'search_early_discount_flag',
		 		'search_bunrui',
		 		'search_keyword',
			 ];
	}
	else
	{
		backupDetailArray =
			[
		 		'search_hatsu',
		 		'search_destination',
		 		'search_date',
		 		'search_kikan',
		 		'search_conductor',
		 		'search_transport',
		 		'search_dep_airport',
		 		'search_airline',
		 		'search_bus_boarding',
		 		'search_hotel',
		 		'search_stock',
		 		'search_decide',
		 		'search_mainbrand',
		 		'search_early_discount_flag',
		 		'search_bunrui',
		 		'search_keyword',
			 ];
	}

	// 再検索画面の閉じるボタンをクリックしたら
	$(document).on("click",".close-btn", function() {
		// フラグを立てる
		$("#close_btn_flag").val("1");
	});


	// それぞれの項目をバックアップとる
	$.each(backupDetailArray,function(index,val){

		backupDetailSearch[val] = $("."+val).html();

	});

});

//　再検索結果ページ（画面表示時）
$(document).on('pageshow','#search_detail_page',function(e) {

	ditailInit();

	// 閉じるボタンで検索結果画面に遷移していたなら
	if($("#close_btn_flag").val() != "")
	{
		// 初回表示を表示
		// それぞれの項目をバックアップから入れる
		$.each(backupDetailArray,function(index,val){

			$("."+val).html(backupDetailSearch[val]);
		});

		// 旅行代金だけそのまま貼り付けると動作しなくなるのでここで行う
		clearPrice();

		$("#close_btn_flag").val("");
	}

	// それぞれの項目をバックアップとる
	$.each(backupDetailArray,function(index,val){

		backupDetailSearch[val] = $("."+val).html();

	});

	checkFooterSearch();

});

window.onload = function()
{
	// ページ読込語後ろにヒット件数取得
	checkFooterSearch();
};

function ditailInit()
{
	$("#searchBtn input").val("再検索");
	$("#searchBtn div").css("padding-left","15px");

	// トップ画面で設定した検索項目をここで設定

	// 項番38 フリーワード検索時のフラグを立てる
	// if ($("#free_word").val() != "" ) {
	// 	$("#freeword_flag").val(1);
	// } else {
	// 	$("#freeword_flag").val(0);
	// }

	// フリープランの時
	if($("#free_flag").val() != '')
	{
		// 出発空港or到着空港を受け取ったら。フリープランの時
		if($("#p_dep_airport_code").val()　!= "" || $("#p_arr_airport_code").val() != "")
		{
			// 出発空港
			var html = '';
			var chkObj = $("#p_dep_airport_code").val().split(",");
			var chkObjText = $("#p_dep_airport_detail").val().split(",");
			if(chkObj != "")
			{
				// 選んだ出発空港の表記のためにhtmlをループ
				for(var i=0;i < chkObj.length;i++)
				{
					html += '<li><div><input type="button" class="del_dep_airport" value="削除" data-value="'+ chkObj[i] +'"><span class="decided_text" href="#modal_dep_airport">'+ chkObjText[i] +'</span></div></li>';
				}


				detailInitAction('dep_airport',html,true);
			}

			// 到着空港
			var html = '';
			var chkObj = $("#p_arr_airport_code").val().split(",");
			var chkObjText = $("#p_arr_airport_detail").val().split(",");

			if(chkObj != "")
			{
				// 選んだ到着空港の表記のためにhtmlをループ
				for(var i=0;i < chkObj.length;i++)
				{
					html += '<li><div><input type="button" class="del_arr_airport" value="削除" data-value="'+ chkObj[i] +'"><span class="decided_text" href="#modal_arr_airport">'+ chkObjText[i] +'</span></div></li>';
				}

				detailInitAction('arr_airport',html,true);
			}


			$(".search_transport input:eq(1)").prop('checked',true);

			$(".search_hatsu").hide();
			$(".search_dep_airport").show();
			$(".search_arr_airport").show();


		}
		else
		{
			$(".search_hatsu").show();
			$(".search_dep_airport").hide();
			$(".search_arr_airport").hide();
		}

		// 交通機関
		if($("#p_transport").val() != "")
		{
			switch($("#p_transport").val())
			{
				case '3':
					index = 1;
					break;
				case '2':
					index = 2;
					break;
				case '1,4':
					index = 3;
					break;
			}

			$(".search_transport input:eq("+ index +")").prop("checked","true");
		}

	}
	else
	{
		// 出発空港を表示
		$(".search_dep_airport.no-icn").show();
	}


	// 出発地
	var html = '';
	var chkObj = $("#p_hatsu_detail_param").val().split("/");
	var chkObjText = $("#p_hatsu_detail").val().split(",");

	if(chkObj != "")
	{
		// 選んだ出発地の表記のためにhtmlをループ
		for(var i=0;i < chkObj.length;i++)
		{
			html += '<li><div><input type="button" class="del_hatsu" value="削除" data-value="'+ chkObj[i] +'"><span class="decided_text" href="#modal_hatsu">'+ chkObjText[i] +'</span></div></li>';
		}

		detailInitAction('hatsu',html,true);
	}

	// 目的地
	var html = '';
	var chkObj = $("#p_mokuteki").val().split(",");
	var chkObjText = $("#p_mokuteki_detail").val().split(",");
	if(chkObj != "")
	{
		// 選んだ出発地の表記のためにhtmlをループ
		for(var i=0;i < chkObj.length;i++)
		{
			html += '<li><div><input type="button" class="del_destination" value="削除" data-value="'+ chkObj[i] +'"><span class="decided_text" href="#modal_destination">'+ chkObjText[i] +'</span></div></li>';
		}

		detailInitAction('destination',html,true);

		if(1 < chkObj.length)
		{
			// 周遊ラジオボタンなどを表示
			$(".destination-select").show();
		}

		// 3この時追加ボタン非表示
		if(chkObj.length == 3)
		{
			//$("#add_destination").hide();
		}
	}

	// 出発日
	if($("#p_dep_date").val() != "")
	{
		html = '<li><div><input type="button" class="del_date" value="削除" data-value="'+ $("#p_dep_date").val() +'"><span class="decided_text" href="#modal_hatsu">'+ makeDepDate(resultParamName.p_dep_date) +'</span></div></li>';
		detailInitAction('date',html,true);
	}

	// 旅行期間
	if($("#p_kikan_min").val() != "" && $("#p_kikan_max").val() != "")
	{
		html = '<li><div><input type="button" class="del_kikan" value="削除"><span class="decided_text" href="#modal_kikan">'+ makeKikan(resultParamName.p_kikan_min,resultParamName.p_kikan_max) +'</span></div></li>';
		detailInitAction('kikan',html,true);
	}

	// 添乗員
	if($("#p_conductor").val() != "")
	{
		html = '<li><div><input type="button" class="del_conductor" value="削除" data-value="'+ $("#p_conductor").val() +'"><span class="decided_text" href="#modal_hatsu">'+ resultParamName.p_conductor +'</span></div></li>';
		detailInitAction('conductor',html,true);
	}


	// 旅行代金のスライダーの初期値表示
	priceSliderInit();


	// 時間をおく
	setTimeout(function() {
		// 件数取得
		getHitNum();
	}, 1000);

}

// 旅行代金のスライダーの初期値表示
function priceSliderInit()
{
	var options = {
			formObj:'#searchTour',
			kind:"Detail",
			p_data_kind:1,
			p_rtn_data:'p_price_flg'
	}
	searchTour.requestProcess(options);	//Ajax通信実施

	var settings = {
		dataType: "json",
		success: function(json){
			//応答結果を編集
			if(json.ErrMes){
				//エラー
			}else{
				if(typeof json.p_price_flg != 'undefined'){
				slider(json.p_price_flg);
				}
			}
		}
	}
	searchTour.ajaxProcess(settings);

	var slider = function(json) {

		var priceArray = [];
		$.each(json,function(index,val){

			if(0 < val.facet)
			{
				priceArray.push(val.key);
			}
		});

		var price_min = priceArray[0];
		var price_max = priceArray[priceArray.length - 1];

		$("#price_min").val(getKey(price_min));
		$("#price_max").val(getKeyMax(price_max));

		price_min = price_t[$("#price_min").val()];
		price_max = price_t[$("#price_max").val()];

		// 100万の時
		if(price_max == '1000000')
		{
			$(".price-txt span").html(addFigure(price_min) + '〜上限なし');
			// 値を反映
			$("#p_price_min").val(price_min);
			$("#p_price_max").val("");
			$("#p_price_min_default").val(price_min);
			$("#p_price_max_default").val("");
		}
		else
		{
			$(".price-txt span").html(addFigure(price_min) + '〜' + addFigure(price_max) + '円');
			// 値を反映
			$("#p_price_min").val(price_min);
			$("#p_price_max").val(price_max);
			$("#p_price_min_default").val(price_min);
			$("#p_price_max_default").val(price_max);
		}

		// スライダのリフレッシュ
		$('#price_min,#price_max').slider('refresh');

		// 初回表示のinputバックアップ
		// 旅行代金のajaxの関係でここでバックアップを取得
		backupInput = $("#searchTour").html();
		backupInput = backupInput.replace('<input type="hidden" id="close_btn_flag" name="close_btn_flag" value="">', '<input type="hidden" id="close_btn_flag" name="close_btn_flag" value="1">');

	};





}

function clearPrice()
{
	var price_min = $("#p_price_min_default").val();;
	var price_max = $("#p_price_max_default").val();
	if(price_max == '')
	{
		price_max = '1000000';
	}

	$("#price_min").val(getKey(price_min));
	$("#price_max").val(getKey(price_max));

	// 100万の時
	if(price_max == '1000000')
	{
		$(".price-txt span").html(addFigure(price_min) + '〜上限なし');
		// 値を反映
		$("#p_price_min").val(price_min);
		$("#p_price_max").val("");
	}
	else
	{
		$(".price-txt span").html(addFigure(price_min) + '〜' + addFigure(price_max) + '円');
		// 値を反映
		$("#p_price_min").val(price_min);
		$("#p_price_max").val(price_max);
	}

	// スライダのリフレッシュ
	$('#price_min,#price_max').slider('refresh');

}
