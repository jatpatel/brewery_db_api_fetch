import * as jQuery from 'jquery';
import * as Q from 'q';

const breweryApi = 'http://localhost:3000/api/beers';


export function getBeers(abv:string, page?:number):Q.Promise<any> {
    let request = $.get(breweryApi, {
        abv: abv,
        page: page
    });


    return Q(request).then((result:any) => {
         return result.data;
    });
}
