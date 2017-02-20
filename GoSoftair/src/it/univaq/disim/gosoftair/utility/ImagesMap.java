package it.univaq.disim.gosoftair.utility;

import java.awt.Color;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.geom.Line2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.NoSuchFileException;
import java.nio.file.Paths;

import javax.imageio.ImageIO;

import java.awt.BasicStroke;



public class ImagesMap {

	private static final int IMG_WIDTH = 56;
	private static final int IMG_HEIGHT = 56;
	
	
	public static void generateImagesMap(String savePath, String inputNameImage) {
		BufferedImage img = null;
		Color red = new Color(247, 34, 34);
		Color blue = new Color(30, 144, 255);
		Color orange = new Color(255, 128, 0);
		
		Color[] colors = { red, blue, orange };
		int counter;
		
		try {
		    img = ImageIO.read(new File(savePath + File.separator + "original" + inputNameImage));
		} catch (IOException e) {
			System.out.print(e);
		}
		
		Image scaledImage = img.getScaledInstance(IMG_WIDTH, IMG_HEIGHT, Image.SCALE_SMOOTH);

		int width = scaledImage.getWidth(null);
		int height = scaledImage.getHeight(null);

		// width and height are of the toolkit image
		BufferedImage newImage = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
		Graphics2D g = (Graphics2D) newImage.getGraphics();
		g.drawImage(scaledImage, 0, 0, null);
		try {
		    File outputfile = new File(savePath + File.separator + inputNameImage);
		    ImageIO.write(newImage, "jpg", outputfile);
		} catch (IOException e) {
			System.out.print(e);
		}
		
		for(counter = 0; counter < 3; counter++) {
			g.setColor(colors[counter]);
	        g.setStroke(new BasicStroke(10));
			g.drawLine(0, 0, IMG_WIDTH, 0);
			g.drawLine(0, 0, 0, IMG_HEIGHT);
			g.drawLine(IMG_WIDTH, 0, IMG_WIDTH, IMG_HEIGHT);
			g.drawLine(0, IMG_HEIGHT, IMG_WIDTH, IMG_HEIGHT);
			try {
			    File outputfile = new File(savePath + File.separator + counter + inputNameImage);
			    ImageIO.write(newImage, "jpg", outputfile);
			} catch (IOException e) {
				System.out.print(e);
			}
		}
		g.dispose();
		try {
			Files.delete(Paths.get(savePath + File.separator + "original" + inputNameImage));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}