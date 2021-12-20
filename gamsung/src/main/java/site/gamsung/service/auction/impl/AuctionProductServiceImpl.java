package site.gamsung.service.auction.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import site.gamsung.service.auction.AuctionProductDAO;
import site.gamsung.service.auction.AuctionProductService;
import site.gamsung.service.domain.AuctionProduct;
import site.gamsung.service.domain.AuctionSearch;

@Service("auctionProductService")
public class AuctionProductServiceImpl implements AuctionProductService{

	@Autowired(required = false)
	@Qualifier("auctionProductDAO")
	private AuctionProductDAO auctionProductDAO;
	
	public AuctionProductServiceImpl(){
		// TODO Auto-generated constructor stub
	}

	@Override
	public List<AuctionProduct> listAuctionProduct(AuctionSearch auctionSearch) {
		// TODO Auto-generated method stub
			
		return auctionProductDAO.listAuctionProduct(auctionSearch);
	}

	@Override
	public AuctionProduct getAuctionProduct(String auctionProductNo) {
		// TODO Auto-generated method stub
		return auctionProductDAO.getAuctionProduct(auctionProductNo);
	}
	
	

	
}
