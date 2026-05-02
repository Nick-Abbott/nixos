{ pkgs, ... }:

{
  home.packages = with pkgs; [
    (python3.withPackages (ps: with ps; [
      pip
      pillow
      numpy
      opencv4
      torch
      torchvision
      matplotlib
      polars
      fastapi
      uvicorn
      python-multipart
      pytesseract
      easyocr
      ultralytics
    ]))
    tesseract
  ];
}
