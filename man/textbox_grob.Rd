% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/textbox-grob.R
\name{textbox_grob}
\alias{textbox_grob}
\title{Draw formatted multi-line text with word wrap}
\usage{
textbox_grob(
  text,
  x = NULL,
  y = NULL,
  width = unit(1, "npc"),
  height = NULL,
  minwidth = NULL,
  maxwidth = NULL,
  minheight = NULL,
  maxheight = NULL,
  hjust = 0.5,
  vjust = 0.5,
  halign = 0,
  valign = 1,
  default.units = "npc",
  margin = unit(c(0, 0, 0, 0), "pt"),
  padding = unit(c(0, 0, 0, 0), "pt"),
  r = unit(0, "pt"),
  orientation = c("upright", "left-rotated", "right-rotated", "inverted"),
  name = NULL,
  gp = gpar(),
  box_gp = gpar(col = NA),
  vp = NULL,
  use_markdown = TRUE
)
}
\arguments{
\item{text}{Character vector containing Markdown/HTML string to draw.}

\item{x, y}{Unit objects specifying the location of the reference point.
If set to \code{NULL} (the default), these values are chosen based on the
values of \code{hjust} and \code{vjust} such that the box is appropriately
justified in the enclosing viewport.}

\item{width, height}{Unit objects specifying width and height of the
grob. A value of \code{NULL} means take up exactly the space necessary
to render all content. Use a value of \code{unit(1, "npc")} to have the
box take up all available space.}

\item{minwidth, minheight, maxwidth, maxheight}{Min and max values for
width and height. Set to \code{NULL} to impose neither a minimum nor
a maximum. Note: \code{minheight} and \code{maxheight} do not work if \code{width = NULL}.}

\item{hjust, vjust}{Numerical values specifying the justification
of the text box relative to the reference point defined by \code{x} and \code{y}. These
justification parameters are specified in the internal reference frame of
the text box, so that, for example, \code{hjust} adjusts the vertical
justification when the text box is left- or right-rotated.}

\item{halign, valign}{Numerical values specifying the justification of the text
inside the text box.}

\item{default.units}{Units of \code{x}, \code{y}, \code{width}, \code{height}, \code{minwidth},
\code{minheight}, \code{maxwidth}, \code{maxheight} if these are provided only as
numerical values.}

\item{margin, padding}{Unit vectors of four elements each indicating the
margin and padding around each text label in the order top, right,
bottom, left. Margins are drawn outside the enclosing box (if any),
and padding is drawn inside. To avoid rendering artifacts, it is best
to specify these values in absolute units (such as points, mm, or inch)
rather than in relative units (such as npc).}

\item{r}{The radius of the rounded corners. To avoid rendering artifacts,
it is best to specify this in absolute units (such as points, mm, or inch)
rather than in relative units (such as npc).}

\item{orientation}{Orientation of the box. Allowed values are \code{"upright"},
\code{"left-rotated"}, \code{"right-rotated"}, and \code{"inverted"}, corresponding to
a rotation by 0, 90, 270, and 180 degrees counter-clockwise, respectively.}

\item{name}{Name of the grob.}

\item{gp}{Other graphical parameters for drawing.}

\item{box_gp}{Graphical parameters for the enclosing box around each text label.}

\item{vp}{Viewport.}

\item{use_markdown}{Should the \code{text} input be treated as markdown?}
}
\value{
A grid \code{\link{grob}} that represents the formatted text.
}
\description{
The function \code{textbox_grob()} is intended to render multi-line text
labels that require automatic word wrapping. It is similar to
\code{\link[=richtext_grob]{richtext_grob()}}, but there are a few important differences. First,
while \code{\link[=richtext_grob]{richtext_grob()}} is vectorized, \code{textbox_grob()} is not. It
can draw only a single text box at a time. Second, \code{textbox_grob()}
doesn't support rendering the text box at arbitrary angles. Only
four different orientations are supported, corresponding to a
rotation by 0, 90, 180, and 270 degrees.
}
\examples{
library(grid)
g <- textbox_grob(
  "**The quick brown fox jumps over the lazy dog.**<br><br>
  The quick brown fox jumps over the lazy dog.
  The **quick <span style='color:brown;'>brown fox</span>** jumps over the lazy dog.
  The quick brown fox jumps over the lazy dog.",
  x = unit(0.5, "npc"), y = unit(0.7, "npc"), halign = 0, valign = 1,
  gp = gpar(fontsize = 15),
  box_gp = gpar(col = "black", fill = "lightcyan1"),
  r = unit(5, "pt"),
  padding = unit(c(10, 10, 10, 10), "pt"),
  margin = unit(c(0, 10, 0, 10), "pt")
)
grid.newpage()
grid.draw(g)

# internal vs. external alignment
g1 <- textbox_grob(
  "The quick brown fox jumps over the lazy dog.",
  hjust = 0, vjust = 1, halign = 0, valign = 1,
  width = unit(1.5, "inch"), height = unit(1.5, "inch"),
  box_gp = gpar(col = "black", fill = "cornsilk"),
  padding = unit(c(2, 2, 2, 2), "pt"),
  margin = unit(c(5, 5, 5, 5), "pt")
)
g2 <- textbox_grob(
  "The quick brown fox jumps over the lazy dog.",
  hjust = 1, vjust = 1, halign = 0.5, valign = 0.5,
  width = unit(1.5, "inch"), height = unit(1.5, "inch"),
  box_gp = gpar(col = "black", fill = "cornsilk"),
  padding = unit(c(2, 2, 2, 2), "pt"),
  margin = unit(c(5, 5, 5, 5), "pt")
)
g3 <- textbox_grob(
  "The quick brown fox jumps over the lazy dog.",
  hjust = 0, vjust = 0, halign = 1, valign = 1,
  width = unit(1.5, "inch"), height = unit(1.5, "inch"),
  box_gp = gpar(col = "black", fill = "cornsilk"),
  padding = unit(c(2, 2, 2, 2), "pt"),
  margin = unit(c(5, 5, 5, 5), "pt")
)
g4 <- textbox_grob(
  "The quick brown fox jumps over the lazy dog.",
  hjust = 1, vjust = 0, halign = 0, valign = 0,
  width = unit(1.5, "inch"), height = unit(1.5, "inch"),
  box_gp = gpar(col = "black", fill = "cornsilk"),
  padding = unit(c(2, 2, 2, 2), "pt"),
  margin = unit(c(5, 5, 5, 5), "pt")
)
grid.newpage()
grid.draw(g1)
grid.draw(g2)
grid.draw(g3)
grid.draw(g4)

# internal vs. external alignment, with rotated boxes
g1 <- textbox_grob(
  "The quick brown fox jumps over the lazy dog.",
  hjust = 1, vjust = 1, halign = 0, valign = 1,
  width = unit(1.5, "inch"), height = unit(1.5, "inch"),
  orientation = "left-rotated",
  box_gp = gpar(col = "black", fill = "cornsilk"),
  padding = unit(c(2, 2, 2, 2), "pt"),
  margin = unit(c(5, 5, 5, 5), "pt")
)
g2 <- textbox_grob(
  "The quick brown fox jumps over the lazy dog.",
  hjust = 0, vjust = 1, halign = 0.5, valign = 0.5,
  width = unit(1.5, "inch"), height = unit(1.5, "inch"),
  orientation = "right-rotated",
  box_gp = gpar(col = "black", fill = "cornsilk"),
  padding = unit(c(2, 2, 2, 2), "pt"),
  margin = unit(c(5, 5, 5, 5), "pt")
)
g3 <- textbox_grob(
  "The quick brown fox jumps over the lazy dog.",
  hjust = 1, vjust = 1, halign = 1, valign = 1,
  width = unit(1.5, "inch"), height = unit(1.5, "inch"),
  orientation = "inverted",
  box_gp = gpar(col = "black", fill = "cornsilk"),
  padding = unit(c(2, 2, 2, 2), "pt"),
  margin = unit(c(5, 5, 5, 5), "pt")
)
g4 <- textbox_grob(
  "The quick brown fox jumps over the lazy dog.",
  hjust = 1, vjust = 0, halign = 0, valign = 0,
  width = unit(1.5, "inch"), height = unit(1.5, "inch"),
  orientation = "upright",
  box_gp = gpar(col = "black", fill = "cornsilk"),
  padding = unit(c(2, 2, 2, 2), "pt"),
  margin = unit(c(5, 5, 5, 5), "pt")
)
grid.newpage()
grid.draw(g1)
grid.draw(g2)
grid.draw(g3)
grid.draw(g4)
}
\seealso{
\code{\link[=richtext_grob]{richtext_grob()}}
}
