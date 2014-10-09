
  var sword = '';

  $(document).ready(function(){
     $("#search").click(function() { 

      //get Search Word
      sword = document.getElementById('searchWord').value;

      //has keyword
      if(sword){

      //set variables for SuggestList
      var rNames = new Array;
      var rImages = new Array;
      var rAreaCats = new Array;
      var rLinks = new Array;

      //reset suggest list by jQuery
      $("#suggestList").html('');

      //show SuggestListBox
      document.getElementById('suggestListBox').style.display = 'block';


      //scrape from Tabelog by "jquery.xdomainajax.js"
      $.ajax({
          url: 'http://tabelog.com/osaka/A2701/A270101/R1364/rstLst/?lid=hd_search1&vs=1&SrtT=trend&sw=' + sword + '&SrtT=rtl',
          type: 'GET',
          success: function(tabelogList) {
        

          //make Array for suggestList by jQuery
          $(tabelogList.responseText).find('.rstlst-group').each(function(){
            rNames.push($(this).find('.rstname-wrap a').html());
            rImages.push($(this).find('.photoimg img').attr('src'));
            rAreaCats.push($(this).find('.area-catg').html());
            rLinks.push($(this).find('.rstname-wrap a').attr('href'));
          });

          //count of Restaurant
          var rNumber = rNames.length;

          //make suggestList Loop
          var suggestList = '';
          var rImg, rName, rLink, rAreaCat, rTmp;
          for(i=0; i<rNumber; i++) {
            rimg = '<img src="' + rImages[i] + '">';
            rName = '<span class="rname">' + rNames[i] + '</span><br>';
            rLink = '<a href="javascript:void(0)" onclick="addRestData(\'' + rLinks[i] + '\')">選択</a>';
            rAreaCat = '<span class="area-cat">' + rAreaCats[i] + '</span>';

            rTmp = '<li id="restaurantID' + i + '">' + rimg + rName + rAreaCat + rLink + '</li>';
            suggestList = suggestList + rTmp;
          };

          if(rNumber<5) {
            var maxheight = 70 * rNumber;
            document.getElementById('suggestListBox').style.height = 70 * rNumber;
          }

          //hide Loading gif Image
          document.getElementById('suggestList').style.backgroundImage = 'none';

          //output suggest list by jQuery
          $("#suggestList").html(suggestList);
          
          }
      });

      } else {　//unless has_keyword
        document.getElementById('searchWord').style.backgroundColor = 'pink';
      };


    });
  });

  //add to Registar form
  function addRestData(tabelogUrl) {

    //hidden SuggestListBox
      document.getElementById('suggestListBox').style.display = 'none';

      //has tabelogUrl
      if(tabelogUrl){

      //scrape from Tabelog by "jquery.xdomainajax.js"
      $.ajax({
          url: tabelogUrl,
          type: 'GET',
          success: function(tavelogDtl) {
        
          //extract from restaurant Data by jQuery
          var rdtlName = $(tavelogDtl.responseText).find('#rdhead-name .display-name').text();
          var rdtlImage = $(tavelogDtl.responseText).find('#contents-photo img').eq(1).attr('src');
          var rdtlCat = $(tavelogDtl.responseText).find('#rstdata-wrap td').eq(1).text();
          var rdtlLink = $(tavelogDtl.responseText).find('#rdhead-name a').attr('href');
          var rdtlTabelogID = $(tavelogDtl.responseText).find('#layout_rst_dtl_data').data('rstid');
          var rdlAddress = $(tavelogDtl.responseText).find('#rstdata-wrap .address span').text();
          var rdlPhoneNo = $(tavelogDtl.responseText).find('.visit-action .tel').text();
          var rdlLunchCost = $(tavelogDtl.responseText).find('.budget-info a').text();
          var rdlLunchScore = $(tavelogDtl.responseText).find('.score-s em').eq(1).text();
          var rdlClosed = $(tavelogDtl.responseText).find('#rstdata-wrap td').eq(6).find('p').eq(0).text();

          //var dummyData = rdtlName + rdlLunchCost + rdlPhoneNo + rdlAddress + rdtlCat + rdlLunchScore
          //+ rdtlImage + rdtlLink + rdlClosed;


          //output form data
          document.addRestaurantForm.rdtlName.value = rdtlName;
          document.addRestaurantForm.rdtlImage.value = rdtlImage;
          document.addRestaurantForm.rdtlImagepreview.src = rdtlImage;
          document.addRestaurantForm.rdtlCat.value = rdtlCat;
          document.addRestaurantForm.rdtlLink.value = rdtlLink;
          document.addRestaurantForm.rdlAddress.value = rdlAddress;
          document.addRestaurantForm.rdlPhoneNo.value = rdlPhoneNo;
          document.addRestaurantForm.rdlLunchCost.value = rdlLunchCost;
          document.addRestaurantForm.rdlLunchScore.value = rdlLunchScore;
          document.addRestaurantForm.rdlClosed.value = rdlClosed;

          //for rails form
          $('#restaurant_restaurant_name').val(rdtlName);
          $('#restaurant_address').val(rdlAddress);
          $('#restaurant_budget').val(rdlLunchCost);
          $('#restaurant_tel').val(rdlPhoneNo);
          $('#restaurant_holiday').val(rdlClosed);
          $('#restaurant_tabelog_id').val(rdtlTabelogID);
          $('#restaurant_tabelog_score').val(rdlLunchScore);
          
          }
      });

      } else {　//unless has_url
        alert('詳細データにアクセスできなかったよー');
      };

  }

  function resetBg(){
    document.getElementById('searchWord').style.backgroundColor = '#fff';
  }

  //hidden target box
  function hiddenBox(target) {
    document.getElementById(target).style.display = 'none';
  }