<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
    <head>
        <title>Using Masonry, get some DIV's by AJAX and append to container.</title>

        <style>
        	body {
				text-align: center	        	
        	}
			#container {
				background: #ccc;
				position: relative;
				width: 500px;
				margin: 20px auto;
				width: 100%;
			}
			.block {
				height: 150px;
				width: 150px;
				line-height: 150px;
				font-size: 24px;
				background: red;
				float: left;
				margin-bottom: 20px;
				opacity: 0.8;
			}
			.block.large {
				background: green;
				width: 200px;
				height: 200px;
				line-height: 200px;
			}	
			button {
				margin-bottom: 10px;
			}	
			.green {
				color: green;
			}	
			.red {
				color: red;
			}
        </style>

		<script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
		<script src="http://labs.funkhausdesign.com/examples/masonry/masonry.pkgd.min.js"></script>
		
        <script type="text/javascript">
            jQuery(document).ready(function() {
             	
             	// Start Masonry
			 	jQuery('#container').masonry({
					columnWidth: 150,
					itemSelector: '.block',
					gutter: 20,
					isFitWidth: true
             	});
             	
             	jQuery('#test1').click(function(){
	             	// Remove all blocks, then add some large blocks
					jQuery.get('http://labs.funkhausdesign.com/examples/masonry/blocks.html', function( data ) {
					
						// Collect blocks for removal
						var $lessBlocks = jQuery('.block');
						
						// Remove all blocks
						jQuery('#container').masonry( 'remove', $lessBlocks );
						jQuery('#container').masonry();
						
					    // Make jQuery object from HTML string
					    var $moreBlocks = jQuery( data ).filter('div.block');
	
					    // Append new blocks
					    jQuery('#container').append( $moreBlocks );
						
						// This positions new elements like the old elments still exsisted (so ignoring the the remove call on line 63).
						jQuery('#container').masonry( 'appended', $moreBlocks);
						

					});	             	
             	});
             	
             	jQuery('#test3').click(function(){
	             	// Add some large blocks
					jQuery.get('http://labs.funkhausdesign.com/examples/masonry/blocks.html', function( data ) {
						
					    // Make jQuery object from HTML string
					    var $moreBlocks = jQuery( data ).filter('div.block');
	
					    // Append new blocks
					    jQuery('#container').append( $moreBlocks );
						
						// Position new elements
						jQuery('#container').masonry( 'appended', $moreBlocks);

					});	             	
             	});             	            	
             	
             	jQuery('#test4').click(function(){
						
					// Collect blocks for removal
					var $lessBlocks = jQuery('.block');
					
					// Remove blocks
					jQuery('#container').masonry( 'remove', $lessBlocks );
					
					// Position elements
					jQuery('#container').masonry();
					
             	}); 
             	
             	jQuery('#test5').click(function(){
					
					// Remove all blocks
					jQuery('#test4').click();
					
					// Add some blocks
					jQuery('#test3').click();					
					
             	});              	             	

            });
        </script>

    </head>
    <body>
    
        <h3>Using Masonry, get some DIV's by AJAX and append to container.</h3>
		<h4>See page source for full overview.</h4>	
		
		<div id="container">
			<div class="block">1</div>
			<div class="block">2</div>
			<div class="block">3</div>
			<div class="block">4</div>
			<div class="block">5</div>												
		</div>
		
		<br>
		
		<button id="test1">'Remove' all blocks and then 'appended' some new blocks!</button>
		<br>
		<button id="test3">Just 'appended' some blocks!</button>
		<br>
		<button id="test4">Just 'remove' all blocks!</button>

    </body>
</html>
