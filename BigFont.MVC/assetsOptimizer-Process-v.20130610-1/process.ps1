

<# set user preferences
--------------------------#>


<# Specify the BaseNames of JAVASCRIPT files to minify eg @('bigfont') #>
$arrTargetJavascriptFiles = @('bigfont.js', 'bigfont-toc.js');


<# Specify the BaseNames of LESS files to compile eg @('bootstrap', 'responsive', 'bigfont') #>
$arrTargetLessFiles = @('bootstrap.less', 'responsive.less', 'bigfont.less', 'bigfont-responsive.less', 'font-awesome.less');


<# Set to true if you want to optimize or resize IMAGES, which takes some time. #>
$doOptimizeImages = $false;
$doResizeImages = $false;




<# retrieve paths, modules, and executables
--------------------------#>

#retrieve relevant paths and directories
$powerScriptDir = Get-Item(Get-ScriptDirectory);
$rootDir = Get-Item(Split-Path -parent $powerScriptDir);

Write-Host("`n");
Write-Host('processing all assets in the following dir:');
Write-Host($powerScriptParentDir);

#paths for image optimization executables
$executablesDirName = '^executables$'
$executablesDir = Get-ChildItem $powerScriptDir -Directory | Where-Object { $_.Name -match $executablesDirName };
$pngOutFullPath = $executablesDir.FullName + "\fileOptimizer\Plugins64\pngout.exe";
$jpegTranFullPath = $executablesDir.FullName + "\fileOptimizer\Plugins64\jpegtran.exe"
$stripperFullPath = $executablesDir.FullName + "\stripper.exe";

#import modules
Import-Module ($powerScriptDir.FullName + "\modules\minJS\minJS.psm1");
Import-Module ($powerScriptDir.FullName + "\modules\image\Image.psm1");










<#
process lesscss
--------------------------#>

Write-Host("`n");
Write-Host('processing lesscss')

#get appropriate less files in the assets directory
$lessFiles = Get-ChildItem $rootDir.FullName -recurse -include *.less | 
    Where-Object { $arrTargetLessFiles -contains $_.Name }

if($lessFiles.Count -eq 0)
{
    Write-Host('please specify .less files to compile.');
}

foreach ($file in $lessFiles)
{          
    #create the css save directory if it doesn't exist
    $saveDirectory = $file.DirectoryName -replace 'less$', 'css';
    if(!(Test-Path $saveDirectory))
    {
        New-Item -ItemType directory -Path $saveDirectory
    }
    
    #compile and minify
    $savePath = $saveDirectory + '\' + $file.BaseName + '.min.css';    
    lessc -x $file.FullName > $savePath; #this runs lessc -x filename.less > filename.min.css  
    Write-Host($savePath);

    #also, compile and do NOT minify
    $savePath = $saveDirectory + '\' + $file.BaseName + '.css';    
    lessc $file.FullName > $savePath; #this runs lessc filename.less > filename.min.css  
    Write-Host($savePath);

}








<#
process js
--------------------------#>

Write-Host("`n");
Write-Host('processing js')

$jsFiles = Get-ChildItem $rootDir.FullName -recurse -include *.js -exclude *.min.js | 
    Where-Object { $arrTargetJavascriptFiles -contains $_.Name }

if($jsFiles.Count -eq 0)
{
    Write-Host('please specify .js files to minify.');
}

foreach ($file in $jsFiles)
{           
    $str = Get-Content -Path $file.FullName;
    $min = (minify -inputData $str -inputDataType "js");    
    $savePath = ($file.FullName -replace "`\.js", '.min.js');    
    $min | Out-File $savePath;    
    Write-Host($savePath);
}










<#
resize images
--------------------------#>

Write-Host("`n");
Write-Host('resizing images')

if($doResizeImages)
{
    $resizedDirName = 'resized';

    $imgFiles = Get-ChildItem $rootDir.FullName -recurse -include *.png, *jpeg, *jpg | 
        Where-Object { $_.DirectoryName -notmatch ($resizedDirName + '$') }

    if($imgFiles.Count -eq 0)
    {
        Write-Host('please specify image files to resize.');
    }

    #set target widths
    $largeWidth = 1200;
    $desktopWidth = 980;
    $portraitTabletWidth = 768;
    $phoneToTabletWidth = 480;
    $phoneWidth = 320;

    #set target suffixes for save
    $largeSuffix = '-resizeLarge';
    $desktopSuffix = '-resizeDesktop';
    $portraitTabletSuffix = '-resizePortraitTablet';
    $phoneToTabletSuffix = '-resizePhoneToTablet';
    $phoneSuffix = '-resizePhone';
    
    foreach ($file in $imgFiles)
    {                
        $image = $file | Get-image;    
    
        $aspectRatio = $image.Height / $image.Width;

        #create the resized directory for this folder, if it doesn't exist
        $saveDirectory = $file.DirectoryName + '\' + $resizedDirName;    
        if(!(Test-Path $saveDirectory))
        {
            New-Item -ItemType directory -Path $saveDirectory
        }   

        #determine where to stuff the suffix
        $suffixStuffIndex = $file.Name.LastIndexOf('.');

        #function to adhere to DRY principles
        Function ResizeAndRenameImage($newWidth, $newSuffix)
        {
            $newHeight = $aspectRatio * $newWidth;           
              
            #set the savePath
            $savePath = $saveDirectory + '\' + $file.Name.Insert($suffixStuffIndex, $newSuffix);                                                
            if(Test-Path $savePath)
            {
                #file exists so delete it before save.
                #odd that we cannot over write an existing file.
                Remove-Item $savePath;
            }
        
            $image = $image | Set-ImageFilter -filter (Add-ScaleFilter -Width $newWidth -Height $newHeight -passThru) -passThru                    
            $image.SaveFile($savePath);
            Write-Host($savePath);
        }

        #call the function above for all the sizes.
        ResizeAndRenameImage $largeWidth $largeSuffix
        ResizeAndRenameImage $desktopWidth $desktopSuffix
        ResizeAndRenameImage $portraitTabletWidth $portraitTabletSuffix
        ResizeAndRenameImage $phoneToTabletWidth $phoneToTabletSuffix
        ResizeAndRenameImage $phoneWidth $phoneSuffix
    }
}
else
{
    Write-Host('please opt in to resize images');
}














<#
optimize images
--------------------------#>

Write-Host("`n");
Write-Host('optimizing images');


if($doOptimizeImages) 
{                      

$imgFiles = Get-ChildItem $rootDir.FullName -recurse -include *.png, *jpeg, *jpg

foreach ($file in $imgFiles)
{
    Write-Host($file.FullName);

    #strip metadata
    Start-Process $stripperFullPath -ArgumentList $file.FullName -wait

    #process .png files
    if($file.Extension -eq '.png')
    {                          
        Start-Process $pngOutFullPath -argumentList $file.FullName -wait
    }    

    #process .jpg files
    if($file.Extension -eq 'jpg')
    {
        Start-Process $jpegTranFullPath -argumentList $file.FullName -wait
    }
}

} 
else 
{
    Write-Host('please opt in to image optimization');
}












<#
prevent exiting
--------------------------#>
Write-Host("`n");
Write-Host('Press enter to exit.')
Read-Host
Clear-Host
Exit






