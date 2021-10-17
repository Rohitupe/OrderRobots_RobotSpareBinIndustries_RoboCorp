# Create Functoions using FPDF module to generate PDF Files
from fpdf import FPDF


# Generate PDF
def PDFGeneration(Information, Count, file_path):
    document = FPDF()
    document.add_page()
    document.set_font('helvetica', size=12)
    for info in Information:
        try:
            if ".png" in info:
                document.image(info, x=15, y=60)
            elif len(info) > 50:
                document.ln(5)
                document.multi_cell(w=0, txt=info)
            else:
                document.cell(txt=info, ln=1)
        except Exception as e:
            return e
    document.output(f"{file_path}Robot {Count}.pdf")
