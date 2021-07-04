    tag=$(echo $url | awk -F "/" '{print $(NF-1)}')
    dir="/tmp/thread${tag}"
    [ ! -d $dir ] && mkdir $dir
    wget -O "/tmp/temp.html" $url >/dev/null 2>/dev/null
    posts=$(grep -o '"//\(is2.4chan.org\|i.4cdn.org\)[^" ]\+[^s].\(jpg\|png\|jpeg\|gif\)"' /tmp/temp.html | sed 's|"||g' | sed "s|^|https:|g")
    declare -A s
    for post in $posts 
    do
        post_num=$(echo $post | grep -o "[0-9]\+\.")
        [ ${s[$post_num]} ] && continue
        s[$post_num]=1
        wget -nc -P $dir $post >/dev/null 2>/dev/null &
    done
    wait
    chosenimages=$(sxiv -to $dir 2>/dev/null)
    [ ! -z "$chosenimages" ] && cp $chosenimages $(find ~/Pictures -type d | fzf)
