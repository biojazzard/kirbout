<?php
snippet('header');
//snippet('menu');
//snippet('submenu');
?>
<body>
  <div class="kinout">
      <?php foreach($pages->visible() AS $mainItem): ?>
      <section class="content">
        <?php if ($mainItem->title()->value != '' && $mainItem->text()->value != ''): ?>
        <article>
          <?php /* Header Render */ ?>
          <?php if ($mainItem->header()): ?>
          <header>
              <?php echo kirbytext($mainItem->header()); ?>
              <div class="slide-title">
                <?php echo kirbytext($mainItem->title()) ?>
              </div>
          </header>
          <?php endif ?>
          <?php /* Footer Render */ ?>
          <?php if ($mainItem->footer()): ?>
          <footer>
              <?php echo kirbytext($mainItem->footer()); ?>
          </footer>
          <?php endif ?>
          <?php /* Slide Render */ ?>
          <div class="slide-body">
            <?php echo kirbytext($mainItem->text()) ?>
          </div>
        </article>
        <?php endif ?>
        <?php /* The rest of the articles with UP & down */ ?>
        <?php /* Subitems Render */ ?>
        <?php $subItems = $mainItem->children()->visible(); ?>
          <?php if($subItems && $subItems->count()): ?>
              <?php foreach($subItems AS $subItem): ?>
                <article>
                  <?php /* Header Render */ ?>
                  <?php if ($subItem->header()): ?>
                  <header>
                    <?php echo kirbytext($subItem->header()); ?>
                    <div class="sub-slide-title">
                      <?php echo kirbytext($subItem->title()) ?>
                    </div>
                  </header>
                  <?php endif ?>
                  <?php /* Footer Render */ ?>
                  <?php if ($subItem->footer()): ?>
                  <footer>
                      <?php echo kirbytext($subItem->footer()); ?>
                  </footer>
                  <?php endif ?>
                  <div class="sub-slide-body"><?php echo kirbytext($subItem->text()) ?></div>
                </article>
             <?php endforeach ?>   
          <?php endif ?>
      </section>
      <?php endforeach ?>
  </div>
<?php snippet('footer') ?>