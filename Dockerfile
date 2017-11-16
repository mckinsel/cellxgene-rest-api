FROM csweaver/cellxgene
RUN mkdir -p /app
WORKDIR /app
COPY . ./
RUN git submodule update --init pyEM2
RUN npm install --prefix cellxgene/ cellxgene
RUN npm run --prefix cellxgene build
RUN mv cellxgene/build/* templates
RUN pip3 install -ve pyEM2/
EXPOSE 5000:5000
CMD ["python3", "application.py"]