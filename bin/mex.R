t_out = 2
load('/home/meme/bin/bot_meme.rda')
ff = list.files('/tmp', pattern = 'jpg', full.names=T)
if(length(ff) > 3) ff = ff[1:3]
for(pic in 1:length(ff)){
R.utils::withTimeout(meme$sendPhoto(ff[pic]), timeout=t_out, onTimeout = 'silent')
}

