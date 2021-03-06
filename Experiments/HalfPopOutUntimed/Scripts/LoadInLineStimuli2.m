mainFolder = 'LineStimuli/';


folder = 'LineStimuli/';% folder containing face stimuli
filelist = dir([folder '*.jpg']);
display.numImages = length(filelist);
for f = 1:length(filelist)
    [pict, map] = imread([folder filelist(f).name]);%repeat this one every image
    line=[folder filelist(f).name];
    indexN=findstr([folder filelist(f).name], 'o');
    indexR=findstr([folder filelist(f).name], 'r');
    indexC=findstr([folder filelist(f).name], 'c');
    indexV=findstr([folder filelist(f).name], 'v');
    stimNo=str2num(line(indexN+1:indexR-1));
    row=str2num(line(indexR+1:indexC-1));
    column=str2num(line(indexC+1:indexV-1));
   
    
    display.lineSegm(f).im = pict;
    
    display.lineSegm(f).number=indexN;
    display.lineSegm(f).name=[folder filelist(f).name];
    display.lineSegm(f).row = row;
    display.lineSegm(f).column  = column;
    if display.lineSegm(f).row == 0
        
        display.lineSegm(f).targPres  =0;
    else
        display.lineSegm(f).targPres  =1;
    end
    
    if display.lineSegm(f).column >0 & display.lineSegm(f).column<11
        
        display.lineSegm(f).targSide  ='left';
    elseif display.lineSegm(f).column>12
        display.lineSegm(f).targSide  ='right';
    else
        display.lineSegm(f).targSide  ='x';
    end
    
    
end
