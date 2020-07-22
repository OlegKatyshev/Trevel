

class Carousel {
    constructor(sliderId, wrapperId, nextId, prevId){

        this.main = document.getElementById(sliderId);
        this.wrap = document.getElementById(wrapperId);
        this.next_btn = document.getElementById(nextId);
        this.prev_btn = document.getElementById(prevId);
        this.slides = this.wrap.children;
        this.pos=0;

    }


    addListener(){
        this.next_btn.addEventListener('click',this.next.bind(this));
        this.prev_btn.addEventListener('click',this.prev.bind(this));
    }

    next(e){
        this.initCountSlides();

        if(e) clearInterval(this.interval);

        let end = this.countSlide - (this.slides.length-1)

        if(end <= this.pos) {
            this.pos = this.pos - 1;
            this.wrap.style.transform = `translateX(${this.pos * this.widthS}%)`;
        }
        else{

            this.pos = 0;
            this.wrap.style.transform = `translateX(${this.pos * this.widthS}%)`;
        }
    }

    prev(e){
        this.initCountSlides();

        if(e) clearInterval(this.interval);

        if(this.pos < 0) {
            this.pos = this.pos + 1;
            this.wrap.style.transform = `translateX(${this.pos * this.widthS}%)`;
        }
        else{
            this.pos = this.countSlide - (this.slides.length);
            this.wrap.style.transform = `translateX(${this.pos * this.widthS}%)`;
        }

    }

    initCountSlides(){
        if(screen.width < 767){

            this.widthS = 100;
            this.countSlide = 1;
        }
        else if(screen.width >= 768 && screen.width < 1020){

            this.widthS = 50;
            this.countSlide = 2;
        }
        else{
            this.widthS = 25;
            this.countSlide = 4;
        }
    }

    init(){

        this.addListener();
        this.interval = setInterval(()=>{
            this.next();
        },5000)
    }

}

(new Carousel('offer-slider','wrap-slider','slide-next','slide-prev')).init();
