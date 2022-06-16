### Command to compile resume

```
docker build -t arpitjindal1997/latex:latest . -f Dockerfile
docker run -it --rm -v ${PWD}/Modern:/work arpitjindal1997/latex:latest xelatex main.tex
```

You will find `main.pdf` inside `Modern` folder
