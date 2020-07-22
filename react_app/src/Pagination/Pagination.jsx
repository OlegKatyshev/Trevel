import React from 'react';
import {connect} from 'react-redux';
import {selectPage} from '../actions/pagination.js';
import {getTours} from '../actions/search.js'
import './Pagination.scss';


class Pagination extends React.Component {

    constructor(props){
        super(props);
    }


    setClass(pagNum){
        let className = 'page';
        if(pagNum == this.props.active){
            className = className + ' active';
        }
        return className;
    }

    selectPage(page){
        this.props.selectPage({
            active: page,
            pos: this.props.pos
        })

        this.props.getTours();
    }

    nextPage(){
        if(this.props.pages.length > this.props.active) {

            this.props.selectPage({
                active: this.props.active + 1,
                pos: (this.incPos()) ? this.props.pos + 1 : this.props.pos
            });

            this.props.getTours();
        }
    }

    prevPage(){
        if(this.props.active > 1 && this.props.pages.length >= this.props.active) {

            this.props.selectPage({
                active: this.props.active - 1,
                pos: (this.decrPos()) ? this.props.pos - 1 : this.props.pos
            })

            this.props.getTours();
        }
    }

    incPos(){
        if(( this.props.pos + this.props.limit ) < this.props.pages.length && this.props.active >= this.props.limit){
            return true;
        }
        return false;
    }

    decrPos(){
        if(this.props.pos && (this.props.pages.length + 1 - this.props.limit) >= this.props.active){
            return true;
        }
        return false;
    }

    renderPages(){

        let pages = [];
        let limit =  (this.props.pages.length > this.props.limit) ? this.props.limit : this.props.pages.length;
        let i = this.props.pos;

        limit = limit + this.props.pos;

        for(; i < limit; i++){
            pages.push(
                <div key={ this.props.pages[i] }
                     className={ this.setClass(this.props.pages[i]) }
                     onClick={ this.selectPage.bind(this, this.props.pages[i]) }>
                    {this.props.pages[i]}
                </div>);
        }

        pages.unshift(<div key={'prev-page'} className='page prev-page' onClick={this.prevPage.bind(this)}><i className="fa fa-angle-double-left"/></div>);
        pages.push(<div key={'prev-next'} className='page next-page' onClick={this.nextPage.bind(this)}><i className="fa fa-angle-double-right"/></div>);

        return pages;
    }

    render (){

        return (
            (this.props.pages.length) ?
                <div className="pagination">
                    {
                        this.renderPages()
                    }
                </div>
                : null
        );
    }
}

function mapStateToProps(reduxState) {
    return {
        pages: reduxState.search.tours.pages,
        active: reduxState.pagination.active,
        limit: reduxState.pagination.limit,
        pos: reduxState.pagination.pos,
    }
}

function mapActionToProps(dispath) {
    return {
        selectPage: (state) => dispath(selectPage(state)),
        getTours: () => dispath(getTours())
    }
}

export default connect(mapStateToProps,mapActionToProps)(Pagination);