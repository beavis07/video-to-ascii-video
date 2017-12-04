# Encode video to ASCII video

Converts a video from whatever format to a version encoded using ASCII 'pixels' and output as an mp4

Turn this: [Before](https://i.imgur.com/spXNcEm.gifv)

Into this: [After](https://i.imgur.com/mP6v90t.gifv)

## Requirements

### ffmpeg (https://www.ffmpeg.org/)

`brew install ffmpeg`

### Img2txt (with `imlib2`)

`brew install libcaca --with-imlib2`

## Usage

```
bash encode.sh  <input file> <width> <height> <output file name>
```

**Note:** Width & Height are measured in characters rather than pixels
