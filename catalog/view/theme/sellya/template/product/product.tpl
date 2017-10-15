<?php echo $header; ?><?php echo $column_left; ?><?php echo $column_right; ?>
<div id="content" class="span12"><div class="row-fluid"><?php echo $content_top; ?>
  <div class="breadcrumb">
    <div class="breadcrumb-pp">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
    </div>
<script type="text/javascript">
    $(function(){
        $(".tiptip").tipTip();
    });
</script>
    <div id="prev-next">
	  <?php if ($prev_prod_name) { ?>
		  <a href="<?php echo $prev_prod_url; ?>" class="tiptip" title="<?php echo $prev_prod_name;?>"><span style="margin-right:10px">&laquo; <?php echo $text_previous_product;?></span></a>
      <?php } ?>
	  <?php if ($next_prod_name) { ?>
		<a href="<?php echo $next_prod_url; ?>" class="tiptip" title="<?php echo $next_prod_name;?>"><span style="margin-left:10px"><?php echo $text_next_product;?> &raquo;</span></a>
      <?php } ?>
	</div>
  </div>
  <div class="product-info">
    <?php if ($thumb || $images) { ?>
    <div class="left">
      <?php if($this->config->get('sellya_product_zoom_type')== 1) { ?>
      <?php if ($thumb) { ?>
      <div class="image">
      <?php if($special){ ?>
      <span class="sale-icon"><?php echo $text_sale; ?></span>
      <?php } ?>
      <a href="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>" class="colorbox">
      <img src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" id="image" /></a></div>
      <?php } ?>
      <?php if ($images) { ?>
      <div class="image-additional">
        <?php foreach ($images as $image) { ?>
        <a href="<?php echo $image['popup']; ?>" title="<?php echo $heading_title; ?>" class="colorbox">
        <img src="<?php echo $image['thumb']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></a>
        <?php } ?>
      </div>
      <?php } ?>
      <?php } ?>
      <?php if($this->config->get('sellya_product_zoom_type')== 0) { ?>
      <?php if ($thumb) { ?>
      <div class="image">
      <?php if($special){ ?>
      <span class="sale-icon"><?php echo $text_sale; ?></span>
      <?php } ?>
      <a href="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>" class="cloud-zoom" id='zoom1' rel="adjustX: -1, adjustY:-1, tint:'#ffffff',tintOpacity:0.1, zoomWidth:364">
	  <img src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" id="image" /></a>
      <div class="zoom-b hidden-phone">
        <a id="zoom-cb" class="colorbox" href="<?php echo $popup; ?>">Zoom</a>
      </div>
      </div>
      <?php } ?>
      <?php if ($images) { ?>
      <div class="image-additional">
        <a href='<?php echo $popup; ?>' title='<?php echo $heading_title; ?>' class='cloud-zoom-gallery' rel="useZoom: 'zoom1', smallImage: '<?php echo $thumb; ?>' ">
        <img src="<?php echo $thumb; ?>" width="98" title="<?php echo $heading_title; ?>" alt = "<?php echo $heading_title; ?>"/></a>
        <?php foreach ($images as $image) { ?>
        <a href="<?php echo $image['popup']; ?>" title="<?php echo $heading_title; ?>" class="cloud-zoom-gallery" rel="useZoom: 'zoom1', smallImage: '<?php echo $image['thumb']; ?>' ">
        <img src="<?php echo $image['thumb']; ?>" width="98" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></a>
        <?php } ?>
      </div>
      <?php } ?>
      <?php } ?>
    </div>
    <?php } ?>
    <?php if ($thumb =='') { ?>
    <div class="left">
    <div class="image"><?php if($special){ ?><span class="sale-icon"><?php echo $text_sale; ?></span><?php } ?>
    <img src="catalog/view/theme/sellya/image/no_image-308x308.png" />
    </div>
    </div>
    <?php } ?>
    <div class="right">
      <div class="buy">
      <header class="product-name">
      <h1><?php echo $heading_title; ?></h1>
      </header>
      <?php if ($price) { ?>
      <div class="price">
        <?php if (!$special) { ?>
        <?php echo ($price == '$0.00') ? '<input type="button" value="Calculate Price" id="button-calculate-price" class="button-exclusive" onclick="return calculateFlyscreenPrice(true);">' : $price; ?>
        <?php } else { ?>
        <span class="price-old"><?php echo $price; ?></span> <span class="price-new"><?php echo $special; ?></span>
        <?php } ?>
        <br />
        <?php if (false && $tax) { ?>
        <span class="price-tax"><?php echo $text_tax; ?> <?php echo $tax; ?></span><br />
        <?php } ?>
        <?php if ($points) { ?>
        <span class="reward"><small><?php echo $text_points; ?> <?php echo $points; ?></small></span><br />
        <?php } ?>
        <?php if ($discounts) { ?>
        <br />
        <div class="discount">
          <?php foreach ($discounts as $discount) { ?>
          <?php echo sprintf($text_discount, $discount['quantity'], $discount['price']); ?><br />
          <?php } ?>
        </div>
        <?php } ?>
      </div>
          <input type="hidden" id="custom-price" name="option[custom-price]" value="" />
      <?php } ?>
      <?php if ($review_status) { ?>
      <div class="review">
        <div><img src="catalog/view/theme/sellya/image/stars/stars<?php echo $this->config->get('sellya_mid_prod_stars_color'); ?>-<?php echo $rating; ?>.png" alt="<?php echo $reviews; ?>" /><br />
        <a onclick="$('a[href=\'#tab-review\']').trigger('click');"><?php echo $reviews; ?></a>&nbsp;&nbsp;|&nbsp;&nbsp;
        <a onclick="$('a[href=\'#tab-review\']').trigger('click');"><?php echo $text_write; ?></a></div>
      </div>
      <?php } ?>
          <!--
        <div class="description">
        <span><?php echo $text_stock; ?></span> <span class="stock"><?php echo $stock; ?></span><br />
        <?php if ($manufacturer) { ?>
        <span><?php echo $text_manufacturer; ?></span> <a href="<?php echo $manufacturers; ?>"><?php echo $manufacturer; ?></a><br />
        <?php } ?>
        <span><?php echo $text_model; ?></span> <?php echo $model; ?><br />
        <?php if ($reward) { ?>
        <span><?php echo $text_reward; ?></span> <?php echo $reward; ?><br />
        <?php } ?>
        <?php if($this->config->get('sellya_product_viewed_status') ==1) { ?>
        <span><?php echo $text_product_viewed; ?></span> <?php echo $product_info['viewed']; ?>
        <?php } ?>
        </div>
          -->
      <?php if ($options) { ?>
      <div class="options">
        <h4><?php echo $text_option; ?></h4>

        <?php foreach ($options as $option) { ?>
        <?php
          /* Assign sepcific class name for each set option for styling and price calculation. Custom by Stephen. */
          $option_addition_class = "custom-option";
          switch ($option['name']) {
              case 'Width':
                  $option_addition_class .= " option-flyscreen-width";
                  break;
              case 'Height':
                  $option_addition_class .= " option-flyscreen-height";
                  break;
              case 'Colour':
                  $option_addition_class .= " option-flyscreen-color";
                  break;
			  case 'Special Colour':
                  $option_addition_class .= " option-special-colour";
                  break;
			  case 'Reference Number':
                  $option_addition_class .= " option-reference-number";
                  break;
			  case 'Notes':
                  $option_addition_class .= " option-notes";
                  break;
              default:
                  $option_addition_class .= "";
          }
          /********************************************************************/
      ?>
        <?php if ($option['type'] == 'select') { ?>
        <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
          <div class="option-l"><?php if ($option['required']) { ?>
          <span class="required">*</span>
          <?php } ?>
          <b><?php echo $option['name']; ?>:</b></div>
          <div class="option-r"><select name="option[<?php echo $option['product_option_id']; ?>]">
            <option value=""><?php echo $text_select; ?></option>
            <?php foreach ($option['option_value'] as $option_value) { ?>
            <option value="<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
            <?php if ($option_value['price']) { ?>
            (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
            <?php } ?>
            </option>
            <?php } ?>
          </select></div>
        </div>

        <?php } ?>
        <?php if ($option['type'] == 'radio') { ?>
        <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
          <div class="option-l"><?php if ($option['required']) { ?>
          <span class="required">*</span>
          <?php } ?>
          <b><?php echo $option['name']; ?>:</b></div>
          <div class="option-r"><?php foreach ($option['option_value'] as $option_value) { ?>
          <input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" id="option-value-<?php echo $option_value['product_option_value_id']; ?>" />
          <label for="option-value-<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
            <?php if ($option_value['price']) { ?>
            (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
            <?php } ?>
          </label>
          <br />
          <?php } ?></div>
        </div>

        <?php } ?>
        <?php if ($option['type'] == 'checkbox') { ?>
        <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
          <div class="option-l"><?php if ($option['required']) { ?>
          <span class="required">*</span>
          <?php } ?>
          <b><?php echo $option['name']; ?>:</b></div>
          <div class="option-r"><?php foreach ($option['option_value'] as $option_value) { ?>
          <input type="checkbox" name="option[<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>" id="option-value-<?php echo $option_value['product_option_value_id']; ?>" />
          <label for="option-value-<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
            <?php if ($option_value['price']) { ?>
            (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
            <?php } ?>
          </label>
          <br />
          <?php } ?></div>
        </div>

        <?php } ?>
        <?php if ($option['type'] == 'image') { ?>
        <div id="option-<?php echo $option['product_option_id']; ?>" class="option <?php echo $option_addition_class; ?>">
          <div class="option-l"><?php if ($option['required']) { ?>
          <span class="required">*</span>
          <?php } ?>
          <b><?php echo $option['name']; ?>:</b></div>
            <div class="option-r">
                <!--
              <table class="option-image">
              <?php foreach ($option['option_value'] as $option_value) { ?>
              <tr>
                <td style="width: 1px;"><input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" id="option-value-<?php echo $option_value['product_option_value_id']; ?>" /></td>
                <td><label for="option-value-<?php echo $option_value['product_option_value_id']; ?>"><img src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" /></label></td>
                <td><label for="option-value-<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
                    <?php if ($option_value['price']) { ?>
                    (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                    <?php } ?>
                  </label></td>
              </tr>
              <?php } ?>
              </table>
                -->
                <div class="option-image">
                    <?php foreach ($option['option_value'] as $option_value) { ?>
                    <div class="option-one-image">
                        <div>
                            <label for="option-value-<?php echo $option_value['product_option_value_id']; ?>">
                                <img src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" />
                            </label>
                        </div>
                        <div style="line-height: 12px;">
                            <label for="option-value-<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
                            <?php if ($option_value['price']) { ?>
                            (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                            <?php } ?>
                            </label>
                        </div>
                        <div style="line-height: 12px;">
                            <input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" id="option-value-<?php echo $option_value['product_option_value_id']; ?>" />
                        </div>
                    </div>
                    <?php } ?>
                </div>
            </div>
        </div>

        <?php } ?>
        <?php if ($option['type'] == 'text') { ?>
        <div id="option-<?php echo $option['product_option_id']; ?>" class="option <?php echo $option_addition_class; ?>">
          <div class="option-l"><?php if ($option['required']) { ?>
          <span class="required">*</span>
          <?php } ?>
          <b><?php echo $option['name']; ?>:</b>
          <?php if ($option['name'] == 'Width' || $option['name'] == 'Height'): ?>
              <br />
              <?php
                $ranges = explode('-', $option['option_value']);
                echo '<span class="option-range">( '.$ranges[0].'mm - '.$ranges[1].'mm )</span>';
              ?>
              <input type="hidden" id="<?php echo $option['name'].'_min'; ?>" name="<?php echo $option['name'].'_min'; ?>" value="<?php echo $ranges[0]; ?>" />
              <input type="hidden" id="<?php echo $option['name'].'_max'; ?>" name="<?php echo $option['name'].'_max'; ?>" value="<?php echo $ranges[1]; ?>" />
          <?php endif; ?>
          </div>
          <div class="option-r">
              <?php if ($option['name'] == 'Width' || $option['name'] == 'Height'): ?>
              <input type="text" id="<?php echo $option['name'].'_value' ?>" name="option[<?php echo $option['product_option_id']; ?>]" value="" />
              <?php else: ?>
              <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['option_value']; ?>" />
              <?php endif;?>

              <?php
              /* Add a mm unit for the flyscreen width and height. Custom by Stephen */
              if ($option['name'] == 'Width' || $option['name'] == 'Height') echo '<span class="custom-option-mm">mm</span>';
              /****************************************************************/

              /* Add an extra x mark between flyscreen width and height. Custom by Stephen */
              if ($option['name'] == 'Width') {
                  echo '<span class="custom-option-x">x</span>';
              }
              /****************************************************************/
              ?>
          </div>
        </div>
        <?php
        /* Add measurement youtube video after flyscreen height. Custom by Stephen */
		/*
        if ($option['name'] == 'Height') {
          echo '<div class="youtube-link-measurement"><a href="http://www.youtube.com/watch?v=Rqmo2McUmEY" target="_blank">View measurement tutorial video</a></div>';
        }
		*/
        ?>

        <?php } ?>
        <?php if ($option['type'] == 'textarea') { ?>
        <div id="option-<?php echo $option['product_option_id']; ?>" class="option custom-option">
          <div class="option-l"><?php if ($option['required']) { ?>
          <span class="required">*</span>
          <?php } ?>
          <b><?php echo $option['name']; ?>:</b></div>
          <div class="option-r"><textarea name="option[<?php echo $option['product_option_id']; ?>]" ><?php echo $option['option_value']; ?></textarea></div>
        </div>

        <?php } ?>
        <?php if ($option['type'] == 'file') { ?>
        <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
          <div class="option-l"><?php if ($option['required']) { ?>
          <span class="required">*</span>
          <?php } ?>
          <b><?php echo $option['name']; ?>:</b></div>
          <div class="option-r"><input type="button" value="<?php echo $button_upload; ?>" id="button-option-<?php echo $option['product_option_id']; ?>" class="button">
          <input type="hidden" name="option[<?php echo $option['product_option_id']; ?>]" value="" /></div>
        </div>

        <?php } ?>
        <?php if ($option['type'] == 'date') { ?>
        <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
          <div class="option-l"><?php if ($option['required']) { ?>
          <span class="required">*</span>
          <?php } ?>
          <b><?php echo $option['name']; ?>:</b></div>
          <div class="option-r"><input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['option_value']; ?>" class="date" /></div>
        </div>

        <?php } ?>
        <?php if ($option['type'] == 'datetime') { ?>
        <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
          <div class="option-l"><?php if ($option['required']) { ?>
          <span class="required">*</span>
          <?php } ?>
          <b><?php echo $option['name']; ?>:</b></div>
          <div class="option-r"><input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['option_value']; ?>" class="datetime" /></div>
        </div>

        <?php } ?>
        <?php if ($option['type'] == 'time') { ?>
        <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
          <div class="option-l"><?php if ($option['required']) { ?>
          <span class="required">*</span>
          <?php } ?>
          <b><?php echo $option['name']; ?>:</b></div>
          <div class="option-r"><input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['option_value']; ?>" class="time" /></div>
        </div>

        <?php } ?>
        <?php } ?>

        <?php //echo '<div class="youtube-link-installation"><a href="http://www.youtube.com/watch?v=HBR909O9qCs" target="_blank">View installation tutorial video</a></div>'; ?>

      </div>
      <?php } ?>
	  <?php if ($price) { ?>
      <div class="cart">
        <div class="add-to-cart"><?php echo $text_qty; ?>
          <?php if($this->config->get('sellya_product_i_c_status') ==1) { ?>
          <input type="button" class="dec" value=" " />
          <?php } ?>
          <input type="text" name="quantity" size="2" class="i-d-quantity input-mini" value="<?php echo $minimum; ?>" />
          <?php if($this->config->get('sellya_product_i_c_status') ==1) { ?>
          <input type="button" class="inc" value=" " />
          <?php } ?>
          <input type="hidden" name="product_id" size="2" value="<?php echo $product_id; ?>" />
          &nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value="ADD TO ORDER" id="button-cart" class="button-exclusive" onclick="return addThisProduct();" />
          </div><br />
          <!--
        <div class="wishlist-compare"><a onclick="addToWishList('<?php echo $product_id; ?>');"><span class="wishlist"></span><?php echo $button_wishlist; ?></a>
          &nbsp;&nbsp;&nbsp;&nbsp;<a onclick="addToCompare('<?php echo $product_id; ?>');"><span class="compare"></span><?php echo $button_compare; ?></a></div>
          -->
        <?php if ($minimum > 1) { ?>
        <div class="minimum"><?php echo $text_minimum; ?></div>
        <?php } ?>
      </div>
	  <?php } else { ?>
		<div class="cart">
			<a href="/index.php?route=account/login&product_id=<?php echo $product_id; ?>" class="button-exclusive">Login</a>
		</div>
	  <?php } ?>
      </div>
      <div class="share hidden-desktop">
<!-- AddThis Button BEGIN -->
<div class="addthis_toolbox addthis_default_style ">
<a class="addthis_button_preferred_1"></a>
<a class="addthis_button_preferred_2"></a>
<a class="addthis_button_preferred_3"></a>
<a class="addthis_button_preferred_4"></a>
<a class="addthis_button_preferred_5"></a>
<a class="addthis_button_preferred_6"></a><br />
<div style="margin-top: 7px;">
<a class="addthis_counter addthis_pill_style"></a>
</div>
</div>
<script type="text/javascript" src="http://s7.addthis.com/js/250/addthis_widget.js"></script>
<!-- AddThis Button END -->
      </div>
    </div>

<div id="right-sm">
<?php if ($manufacturer) { ?>
<?php if ($manufacturers_img) { ?>
<?php if($this->config->get('sellya_product_manufacturer_logo_status') ==1) { ?>
<div class="right-sm-manufacturer-logo visible-desktop">
<div class="product-manufacturer-logo-block">
     <a href="<?php echo $manufacturers; ?>"><?php echo ($manufacturers_img) ? '<img src="'.$manufacturers_img.'" title="'.$manufacturers.'" />' : $manufacturers ;?></a>
</div>
</div>
<?php } ?>
<?php } ?>
<?php } ?>

<?php if($this->config->get('sellya_product_custom_status')== 1) { ?>
<?php if($this->config->get('sellya_product_custom_content') != '') { ?>
<div class="right-sm-custom visible-desktop">
<div class="product-custom-block">
	<?php if($this->config->get('sellya_product_custom_content') != '') { ?>
    <?php echo htmlspecialchars_decode($this->config->get('sellya_product_custom_content')); ?>
    <?php } ?>
</div>
</div>
<?php } ?>
<?php } ?>

<?php if ($products) { ?>
<?php if($this->config->get('sellya_product_related_status')== 1) { ?>
<?php if($this->config->get('sellya_product_related_position')== 0) { ?>
<div class="right-sm-related visible-desktop">
<div class="product-related">
<h5><?php echo $tab_related; ?></h5>
<script type="text/javascript">
(function($){
	$(function(){
		$('#slider1').bxSlider({
            auto: true,
            mode: 'vertical',
            displaySlideQty: 2,
            moveSlideQty: 2,
            speed: 1500,
            pause: 6000
        });
	});
}(jQuery))
</script>
  <ul id="slider1" >
    <?php foreach ($products as $product) { ?>
    <li>
        <?php if ($product['thumb']) { ?>
        <div class="image"><?php if ($product['special']) { ?><span class="sale-icon"><?php echo $text_sale; ?></span><?php } ?>
        <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" title="<?php echo $product['name']; ?>" alt="<?php echo $product['name']; ?>" /></a></div>
        <?php } else { ?>
        <div class="image"><?php if ($product['special']) { ?><span class="sale-icon"><?php echo $text_sale; ?></span><?php } ?>
        <a href="<?php echo $product['href']; ?>"><img src="catalog/view/theme/sellya/image/no_image-190x190.png" title="<?php echo $product['name']; ?>" alt="<?php echo $product['name']; ?>" /></a>
        </div>
        <?php } ?>
        <div class="description-r hidden-phone hidden-tablet"><?php echo $product['description']; ?></div>
        <div class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
        <?php if ($product['price'] && $product['price'] != '$0.00') { ?>
        <div class="price">
          <?php if (!$product['special']) { ?>
          <?php echo $product['price']; ?>
          <?php } else { ?>
          <span class="price-old"><?php echo $product['price']; ?></span> <span class="price-new"><?php echo $product['special']; ?></span>
          <?php } ?>
        </div>
        <?php } else { ?>
        <div class="price">&nbsp;</div>
        <?php } ?>
    </li>
    <?php } ?>
  </ul>
</div>
</div>
<?php } ?>
<?php } ?>
<?php } ?>

<div class="right-sm-share visible-desktop">
<div class="product-share">
<div class="share">
<!-- AddThis Button BEGIN -->
<div class="addthis_toolbox addthis_default_style ">
<a class="addthis_button_preferred_1"></a>
<a class="addthis_button_preferred_2"></a>
<a class="addthis_button_preferred_3"></a>
<a class="addthis_button_preferred_4"></a>
<a class="addthis_button_preferred_5"></a>
<a class="addthis_button_preferred_6"></a><br />
<div style="margin-top: 7px;">
<a class="addthis_counter addthis_pill_style"></a>
</div>
</div>
<script type="text/javascript" src="http://s7.addthis.com/js/250/addthis_widget.js"></script>
<!-- AddThis Button END -->
</div>
</div>
</div>

  <?php if ($tags) { ?>
  <div class="right-sm-tags visible-desktop">
  <div class="product-tags"><div style="margin-right:3px"><h5><?php echo $text_tags; ?></h5></div><br /><br />
    <?php for ($i = 0; $i < count($tags); $i++) { ?>
    <?php if ($i < (count($tags) - 1)) { ?>
    <div><a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a></div>
    <?php } else { ?>
    <div><a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a></div>
    <?php } ?>
    <?php } ?>
  </div>
  </div>
  <?php } ?>
</div>
</div>

 <section id="product-information">
  <div id="tabs" class="htabs"><a href="#tab-description"><?php echo $tab_description; ?></a>
    <?php if ($attribute_groups) { ?>
    <a href="#tab-attribute"><?php echo $tab_attribute; ?></a>
    <?php } ?>
    <?php if ($review_status) { ?>
    <a href="#tab-review"><?php echo $tab_review; ?></a>
    <?php } ?>
    <?php if($this->config->get('sellya_product_custom_tab_status')== 1) { ?>
    <?php if($this->config->get('sellya_product_custom_tab_content') != '') { ?>
    <a href="#tab-custom"><?php echo $this->config->get('sellya_product_custom_tab_title'); ?></a>
    <?php } ?>
    <?php } ?>
  </div>
  <div id="tab-description" class="tab-content" style="display:block"><article id="<?php echo $heading_title; ?>"><?php echo $description; ?></article></div>
  <?php if ($attribute_groups) { ?>
  <div id="tab-attribute" class="tab-content" style="display:block">
    <table class="attribute">
      <?php foreach ($attribute_groups as $attribute_group) { ?>
      <thead>
        <tr>
          <td colspan="2"><?php echo $attribute_group['name']; ?></td>
        </tr>
      </thead>
      <tbody>
        <?php foreach ($attribute_group['attribute'] as $attribute) { ?>
        <tr>
          <td><?php echo $attribute['name']; ?></td>
          <td><?php echo $attribute['text']; ?></td>
        </tr>
        <?php } ?>
      </tbody>
      <?php } ?>
    </table>
  </div>
  <?php } ?>
  <?php if ($review_status) { ?>
  <div id="tab-review" class="tab-content" style="display:block">
    <article id="review"></article>
    <h2 id="review-title"><?php echo $text_write; ?></h2>
    <b><?php echo $entry_name; ?></b><br />
    <input type="text" name="name" value="" />
    <br />
    <br />
    <b><?php echo $entry_review; ?></b>
    <textarea name="text" cols="40" rows="8" style="width: 98%;"></textarea>
    <span style="font-size: 11px;"><?php echo $text_note; ?></span><br />
    <br />
    <b><?php echo $entry_rating; ?></b> &nbsp;&nbsp;&nbsp;<span><?php echo $entry_bad; ?></span>&nbsp;
    <input type="radio" name="rating" value="1" />
    &nbsp;
    <input type="radio" name="rating" value="2" />
    &nbsp;
    <input type="radio" name="rating" value="3" />
    &nbsp;
    <input type="radio" name="rating" value="4" />
    &nbsp;
    <input type="radio" name="rating" value="5" />
    &nbsp; <span><?php echo $entry_good; ?></span><br />
    <br />
    <b><?php echo $entry_captcha; ?></b><br />
    <input type="text" name="captcha" value="" />
    <br /><br />
    <img src="index.php?route=product/product/captcha" alt="" id="captcha" /><br />
    <br />
    <div class="buttons">
      <div class="right"><a id="button-review" class="button"><?php echo $button_continue; ?></a></div>
    </div>
  </div>
  <?php } ?>

  <?php if($this->config->get('sellya_product_custom_tab_status')== 1) { ?>
  <?php if($this->config->get('sellya_product_custom_tab_content') != '') { ?>
  <div id="tab-custom" class="tab-content" style="display:block">
  <?php echo htmlspecialchars_decode($this->config->get('sellya_product_custom_tab_content')); ?>
  </div>
  <?php } ?>
  <?php } ?>
</section>

  <?php if ($products) { ?>
  <?php if($this->config->get('sellya_product_related_status')== 1) { ?>
  <?php if($this->config->get('sellya_product_related_position')== 1) { ?>
    <h2><?php echo $tab_related; ?></h2>
    <div class="product-grid">
	<?php $counter = 0; foreach ($products as $product) {
	   if (($counter+4) %4 == 0) $xclass="span-first-child";
	   else $xclass=""; ?>
    <div class="span-related <?php echo $xclass; ?>"><div class="pbox">
        <?php if ($product['thumb']) { ?>
        <div class="image"><?php if ($product['special']) { ?><span class="sale-icon"><?php echo $text_sale; ?></span><?php } ?>
        <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" title="<?php echo $product['name']; ?>" alt="<?php echo $product['name']; ?>" /></a></div>
        <?php } else { ?>
        <div class="image"><?php if ($product['special']) { ?><span class="sale-icon"><?php echo $text_sale; ?></span><?php } ?>
        <a href="<?php echo $product['href']; ?>"><img src="catalog/view/theme/sellya/image/no_image-190x190.png" title="<?php echo $product['name']; ?>" alt="<?php echo $product['name']; ?>" /></a>
        </div>
        <?php } ?>
        <div class="description hidden-phone hidden-tablet"><?php echo $product['description']; ?></div>

        <?php if ($product['rating']) { ?>
        <div class="rating hidden-phone hidden-tablet">
        <img src="catalog/view/theme/sellya/image/stars/stars<?php echo $this->config->get('sellya_mid_prod_stars_color'); ?>-<?php echo $product['rating']; ?>.png" alt="<?php echo $product['reviews']; ?>" />
        </div>
        <?php } else { ?>
        <div class="rating hidden-phone hidden-tablet">
        &nbsp;
        </div>
        <?php } ?>

        <div class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
        <?php if ($product['price']) { ?>
        <div class="price">
          <?php if (!$product['special']) { ?>
          <?php echo $product['price']; ?>
          <?php } else { ?>
          <span class="price-old"><?php echo $product['price']; ?></span> <span class="price-new"><?php echo $product['special']; ?></span>
          <?php } ?>
        </div>
        <?php } ?>
         <div class="cart"><input type="button" value="<?php echo $button_cart; ?>" onclick="addToCart('<?php echo $product['product_id']; ?>');" class="button" /></div>
         </div></div>
      <?php $counter++; } ?>
    </div>
  <?php } ?>
  <?php } ?>
  <?php } ?>

  <?php if ($tags) { ?>
  <div class="tags hidden-desktop"><div style="float:left; margin-right:3px"><h5><?php echo $text_tags; ?></h5></div>
    <?php for ($i = 0; $i < count($tags); $i++) { ?>
    <?php if ($i < (count($tags) - 1)) { ?>
    <div><a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a></div>
    <?php } else { ?>
    <div><a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a></div>
    <?php } ?>
    <?php } ?>
  </div>
  <?php } ?>

  <?php echo $content_bottom; ?></div></div>
<script type="text/javascript"><!--
$(document).ready(function() {
	$('.colorbox').colorbox({
		overlayClose: true,
		opacity: 0.5,
		rel: "colorbox"
	});
});
//--></script>
<script type="text/javascript"><!--
$('#button-cart, #button-calculate-price').bind('click', function() {
	$.ajax({
		url: 'index.php?route=checkout/cart/add',
		type: 'post',
		data: $('.product-info input[type=\'text\'], .product-info input[type=\'hidden\'], .product-info input[type=\'radio\']:checked, .product-info input[type=\'checkbox\']:checked, .product-info select, .product-info textarea'),
		dataType: 'json',
		success: function(json) {
			$('.success, .warning, .attention, information, .error').remove();

			if (json['error']) {
				if (json['error']['option']) {
					for (i in json['error']['option']) {
						$('#option-' + i).append('<span class="error">' + json['error']['option'][i] + '</span>');
					}
				}
			}

			if (json['success']) {
                window.location = "/index.php?route=checkout/cart";

                /*
				$('#notification').html('<div class="success" style="display: none;">' + json['success'] + '<img src="catalog/view/theme/sellya/image/close.png" alt="" class="close" /></div>');

				$('.success').fadeIn('slow');

				$('#cart-total').html(json['total']);

				$('html, body').animate({ scrollTop: 0 }, 'slow');
                */
			}
		}
	});
});
//--></script>
<?php if ($options) { ?>
<script type="text/javascript" src="catalog/view/javascript/jquery/ajaxupload.js"></script>
<?php foreach ($options as $option) { ?>
<?php if ($option['type'] == 'file') { ?>
<script type="text/javascript"><!--
new AjaxUpload('#button-option-<?php echo $option['product_option_id']; ?>', {
	action: 'index.php?route=product/product/upload',
	name: 'file',
	autoSubmit: true,
	responseType: 'json',
	onSubmit: function(file, extension) {
		$('#button-option-<?php echo $option['product_option_id']; ?>').after('<img src="catalog/view/theme/default/image/loading.gif" class="loading" style="padding-left: 5px;" />');
		$('#button-option-<?php echo $option['product_option_id']; ?>').attr('disabled', true);
	},
	onComplete: function(file, json) {
		$('#button-option-<?php echo $option['product_option_id']; ?>').attr('disabled', false);

		$('.error').remove();

		if (json['success']) {
			alert(json['success']);

			$('input[name=\'option[<?php echo $option['product_option_id']; ?>]\']').attr('value', json['file']);
		}

		if (json['error']) {
			$('#option-<?php echo $option['product_option_id']; ?>').after('<span class="error">' + json['error'] + '</span>');
		}

		$('.loading').remove();
	}
});
//--></script>
<?php } ?>
<?php } ?>
<?php } ?>
<script type="text/javascript"><!--
$('#review .pagination a').live('click', function() {
	$('#review').fadeOut('slow');

	$('#review').load(this.href);

	$('#review').fadeIn('slow');

	return false;
});

$('#review').load('index.php?route=product/product/review&product_id=<?php echo $product_id; ?>');

$('#button-review').bind('click', function() {
	$.ajax({
		url: 'index.php?route=product/product/write&product_id=<?php echo $product_id; ?>',
		type: 'post',
		dataType: 'json',
		data: 'name=' + encodeURIComponent($('input[name=\'name\']').val()) + '&text=' + encodeURIComponent($('textarea[name=\'text\']').val()) + '&rating=' + encodeURIComponent($('input[name=\'rating\']:checked').val() ? $('input[name=\'rating\']:checked').val() : '') + '&captcha=' + encodeURIComponent($('input[name=\'captcha\']').val()),
		beforeSend: function() {
			$('.success, .warning').remove();
			$('#button-review').attr('disabled', true);
			$('#review-title').after('<div class="attention"><img src="catalog/view/theme/default/image/loading.gif" alt="" /> <?php echo $text_wait; ?></div>');
		},
		complete: function() {
			$('#button-review').attr('disabled', false);
			$('.attention').remove();
		},
		success: function(data) {
			if (data['error']) {
				$('#review-title').after('<div class="warning">' + data['error'] + '</div>');
			}

			if (data['success']) {
				$('#review-title').after('<div class="success">' + data['success'] + '</div>');

				$('input[name=\'name\']').val('');
				$('textarea[name=\'text\']').val('');
				$('input[name=\'rating\']:checked').attr('checked', '');
				$('input[name=\'captcha\']').val('');
			}
		}
	});
});
//--></script>
<script type="text/javascript"><!--
$('#tabs a').tabs();
//--></script>
<script type="text/javascript" src="catalog/view/javascript/jquery/ui/jquery-ui-timepicker-addon.js"></script>
<script type="text/javascript"><!--
$(document).ready(function() {
	if ($.browser.msie && $.browser.version == 6) {
		$('.date, .datetime, .time').bgIframe();
	}

	$('.date').datepicker({dateFormat: 'yy-mm-dd'});
	$('.datetime').datetimepicker({
		dateFormat: 'yy-mm-dd',
		timeFormat: 'h:m'
	});
	$('.time').timepicker({timeFormat: 'h:m'});
});
//--></script>
<script>
$(document).ready(function() {
    $('.option-flyscreen-width input, .option-flyscreen-height input').change(function(){calculateFlyscreenPrice(false)});
    $('.option-flyscreen-color input').click(function(){calculateFlyscreenPrice(false)});
	$('.option-special-colour input').change(function(){calculateFlyscreenPrice(false)});
});

var customer_group_id = <?php echo ($this->customer->getCustomerGroupId()) ? $this->customer->getCustomerGroupId() : 1; ?>;

function calculateFlyscreenPrice(calculate) {
    var w = $('.option-flyscreen-width input#Width_value').val();
    var h = $('.option-flyscreen-height input#Height_value').val();
    var c = $('.option-flyscreen-color input:checked').val();
    var sc = $('.option-special-colour input').val();

    // Error check
    if (w != '') {
        w = parseInt(w, 10);
        var wMin = parseInt($('#Width_min').val(), 10);
        var wMax = parseInt($('#Width_max').val(), 10);
        if (!$.isNumeric(w) || w < wMin || w > wMax) {
            alert("The width entered is not valid! Please enter a number in the given range.");
            $('.option-flyscreen-width input#Width_value').val('');
            $('.option-flyscreen-width input#Width_value').focus();
            return false;
        }
    } else if (calculate) {
        alert('Width is required.');
        $('.option-flyscreen-width input#Width_value').focus();
        return false;
    }

    if (h != '') {
        h = parseInt(h, 10);
        var hMin = parseInt($('#Height_min').val(), 10);
        var hMax = parseInt($('#Height_max').val(), 10);
        if (!$.isNumeric(h) || h < hMin || h > hMax) {
            alert("The height entered is not valid! Please enter a number in the given range.");
            $('.option-flyscreen-height input#Height_value').val('');
            $('.option-flyscreen-height input#Height_value').focus();
            return false;
        }
    } else if (calculate) {
        alert('Height is required.');
        $('.option-flyscreen-height input#Height_value').focus();
        return false;
    }

    if (!c && calculate) {
        alert('Colour is required');
        return false;
    }

    if (w && h && c) {
        var size_factor = (w/1000) * (h/1000);
        var product_id = <?php echo $product_id; ?>;

        var price = 0;
        switch (product_id) {
            case 52:
                price = size_factor * 60 + 150;
                if (sc) price += 100;
                break;
            case 53:
                price = size_factor * 60 + 300;
                if (sc) price += 100;
                break;
            case 54:
            case 55:
                if (h <= 900) price = 165;
                else if (h <= 1700) price = 187;
                else price = 220;
                if (sc) price += 100;
                break;
        }

        switch (customer_group_id) {
            case 2:
                price = price;
                break;
            case 3:
                price = price * 0.9;
                break;
            default:
                price = price * 2;
        }

        $('#custom-price').val(price.toFixed(2));
        $('.buy .price').html('$'+ price.toFixed(2)+'<span class="price-gst">inc. GST</span>');
        $('.buy .price').append('<input type="button" class="recalculate-button" onclick="calculateFlyscreenPrice(true);return false;" value="re-calculate" />');

        return true;
    }
}

function addThisProduct() {
    return calculateFlyscreenPrice(true)
}
</script>
<?php echo $footer; ?>
