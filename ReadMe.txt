Read me

1.  There are two different functions, enhance image or enhance vedio
    See main_image.m and main_vedio.m

    the basic idea is shown below
    (1) RGB -> HSI
    (2) enhance I component
    (3) HSI -> RGB

2.  Two document to achieve step (1) and (3)
    hsi2rgb.m and rgb2hsi.m

1.  all *_enhance.m document are quite the same
    the logic is explained in gst_enhance.m document
    basically, it is shown below
    
    Read HSI (a matrix) from the main function
    seperate it (to 3 parts, H, S and I)
    enhance I by different method
    combine them again