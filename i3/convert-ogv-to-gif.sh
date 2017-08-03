#!/usr/bin/env bash
# Source: https://unix.stackexchange.com/questions/35282/convert-ogv-video-to-gif-animation#44385

INPUT_FILE=$1
OUTPUT_FILE=`node -p "'$INPUT_FILE'.replace(/\..*?\$/, '.gif')"`
WIDTH=`ffprobe -v quiet -print_format json -show_streams "$INPUT_FILE" | jq '.streams[] | select(.codec_type | contains("video")) | .width'`
FPS=`ffprobe -v quiet -print_format json -show_streams "$INPUT_FILE" | jq '.streams[] | select(.codec_type | contains("video")) | .r_frame_rate | split("/")[0] | tonumber'`
TMP_PALETTE_FILE=`mktemp --suffix=.png`

#Generate palette for better quality
ffmpeg -v quiet -y -i "$INPUT_FILE" -vf fps=$FPS,scale=$WIDTH:-1:flags=lanczos,palettegen "$TMP_PALETTE_FILE"

#Generate gif using palette
ffmpeg -v quiet -y -i "$INPUT_FILE" -i "$TMP_PALETTE_FILE" -loop 0 -filter_complex "fps=$FPS,scale=$WIDTH:-1:flags=lanczos[x];[x][1:v]paletteuse" "$OUTPUT_FILE"

rm "$TMP_PALETTE_FILE"

echo $OUTPUT_FILE
